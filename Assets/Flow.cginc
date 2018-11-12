#if !defined(FLOW_INCLUDED)
#define FLOW_INCLUDED

float3 FlowUVW (float2 uv,float2 flowVector,float2 jump ,float flowOffset,float tiling ,float time,bool floatB) {
	float phaseOffset = floatB ? 0.5 : 0;
	float progress = frac(time+phaseOffset);//frac返回输入值的小数部分。
	float3 uvw;
	//uvw.xy = uv - flowVector * progress+phaseOffset;
	uvw.xy = uv - flowVector * (progress + flowOffset);
	uvw.xy *= tiling;
	uvw.xy += phaseOffset;
	uvw.xy += (time-progress)*jump;
	uvw.z = 1 - abs(1 - 2 * progress);
	return uvw;
}

#endif