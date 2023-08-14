Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FECB10E105
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 21:15:52 +0000 (UTC)
Message-ID: <1f43c96a-afe1-ae59-5300-3c4d43a070de@quicinc.com>
Date: Mon, 14 Aug 2023 14:15:22 -0700
MIME-Version: 1.0
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, <igt-dev@lists.freedesktop.org>
References: <20230810202340.2388-1-quic_abhinavk@quicinc.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230810202340.2388-1-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 0/2] add support for passing yuv
 writeback output format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 8/10/2023 1:23 PM, Abhinav Kumar wrote:
> MSM display pipeline has support for writeback to handle YUV formats.
> Currently the kms_writeback supports hard-codes the writeback output
> format to DRM_FORMAT_XRGB8888. This series makes the necessary changes
> in the lib and kms_writeback to allow passing DRM YUV formats to
> kms_writeback.
> 
> The default kms_writeback shall still use only DRM_FORMAT_XRGB8888.
> 
> Additional formats can be passed using the command line.
> 
> Sample usage of this would be:
> 
> ./kms_writeback -d -f <name of the DRM YUV fmt from igt_fb>
> 
> Currently this is supported only along with the --dump option because
> the API which computes CRC needs to be extended to handle formats
> which have more than one plane.
> 
> changes in v2:
> 	- removed an unnecessary new line
> 	- fixed petri's email address
> 
> changes in v3:
> 	- drop the changes to igt_fb_get_fnv1a_crc()
> 	- restrict the custom format to only the --dump option

Added Petri's Reviewed-by tag to both patches as agreed on IRC and 
merged to master, thanks!

[1/2] lib/igt_fb: add a helper to find drm_id from matching string
 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/8ea8b7e63e6c
[2/2] tests/kms_writeback: allow writeback to output custom format
 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/6f70e08cea1c

Thanks,

Jessica Zhang

> 
> Abhinav Kumar (2):
>    lib/igt_fb: add a helper to find drm_id from matching string
>    tests/kms_writeback: allow writeback to output custom format
> 
>   lib/igt_fb.c          | 28 ++++++++++++++++++++++++++++
>   lib/igt_fb.h          |  3 +++
>   tests/kms_writeback.c | 18 +++++++++++++++---
>   3 files changed, 46 insertions(+), 3 deletions(-)
> 
> -- 
> 2.40.1
> 
