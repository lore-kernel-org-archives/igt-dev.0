Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DE0C5478C
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 22:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A8010E97B;
	Tue, 27 Feb 2024 22:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="iHw1ydOK";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E5310E97B
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 22:18:17 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41RME1Wi031051
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 22:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=goRon3RK1VFTixqt2P7WEPIuxwAyc1FxA44pVZSwD+Y=; b=iH
 w1ydOKBREb85xQbj4AJ1c7tT0EUuvhbmr/qIudmo4yQ85U0PJ5rqdZRCiTTnyixQ
 p6GAXLDzRAisz0dRikM1MGXEYdzqHve6hm5ud/4mLGUiclpoey3Mt3v7OYaehzZf
 /p53LuWeqG565wdyMld8bLfzqg7Thjf//pP1u/wqYe8EOjzF9dIf0RuoSFmdEE0w
 q6wc34ey24ekiOdlwYVvY7ZGigUR0dd/XnFQ2jrrn80C4ZGLyAY+lzLC8afhIqEt
 vWkmqIkgDztbqRq7as443ZTDue66SjzFKjpDRQmlmx21Cdq0GbLZdiu9f7uJuuUb
 /3dmhCKgFbadXYNmdL7Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wh6nrjkjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 22:18:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41RMIFnK032727
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 22:18:15 GMT
Received: from [10.71.111.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 27 Feb
 2024 14:18:14 -0800
Message-ID: <488fd30d-d04d-41ed-a277-42a60a392320@quicinc.com>
Date: Tue, 27 Feb 2024 14:18:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/kms_plane_scaling: Pass display to
 get_num_scalars()
To: <igt-dev@lists.freedesktop.org>
References: <20240215222105.327820-1-robdclark@gmail.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240215222105.327820-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: CAzIWRBvOnewe52SvE8wyAjmMZDJVAdY
X-Proofpoint-ORIG-GUID: CAzIWRBvOnewe52SvE8wyAjmMZDJVAdY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-27_09,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402270172
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



On 2/15/2024 2:21 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Prep for next patch.

Hi Rob,

The code in this and the 2nd patch LGTM, but can we change the commit 
message here to be more descriptive?

Or maybe we could squash the 2 patches so it's easier to see why the 
parameter was changed?

Thanks,

Jessica Zhang

> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   lib/igt_kms.c             |  5 +++--
>   lib/igt_kms.h             |  2 +-
>   tests/kms_plane_scaling.c | 24 ++++++++++++------------
>   3 files changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 1b4d0d7612a2..899b3a5001c4 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6333,17 +6333,18 @@ int igt_get_dp_mst_connector_id(igt_output_t *output)
>   
>   /**
>    * get_num_scalers:
> - * @drm_fd: drm file descriptor
> + * @display: the display
>    * @pipe: display pipe
>    *
>    * Returns: Number of scalers supported per pipe.
>    */
> -int get_num_scalers(int drm_fd, enum pipe pipe)
> +int get_num_scalers(igt_display_t *display, enum pipe pipe)
>   {
>   	char buf[8120];
>   	char *start_loc1, *start_loc2;
>   	int dir, res;
>   	int num_scalers = 0;
> +	int drm_fd = display->drm_fd;
>   	char dest[20] = ":pipe ";
>   
>   	strcat(dest, kmstest_pipe_name(pipe));
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index b3882808b42f..7cbaf180a63b 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1217,6 +1217,6 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>   bool intel_pipe_output_combo_valid(igt_display_t *display);
>   bool igt_check_output_is_dp_mst(igt_output_t *output);
>   int igt_get_dp_mst_connector_id(igt_output_t *output);
> -int get_num_scalers(int drm_fd, enum pipe pipe);
> +int get_num_scalers(igt_display_t *display, enum pipe pipe);
>   
>   #endif /* __IGT_KMS_H__ */
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index acb4a1da1ecf..d2dd3fd843e8 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -1038,8 +1038,8 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
>   	igt_output_set_pipe(output1, pipe1);
>   	igt_output_set_pipe(output2, pipe2);
>   
> -	igt_require(get_num_scalers(d->drm_fd, pipe1) >= 2);
> -	igt_require(get_num_scalers(d->drm_fd, pipe2) >= 2);
> +	igt_require(get_num_scalers(display, pipe1) >= 2);
> +	igt_require(get_num_scalers(display, pipe2) >= 2);
>   
>   	plane[0] = igt_output_get_plane(output1, 0);
>   	igt_require(plane[0]);
> @@ -1131,7 +1131,7 @@ static void invalid_parameter_tests(data_t *d)
>   		igt_output_set_pipe(output, pipe);
>   		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   
> -		igt_require(get_num_scalers(d->drm_fd, pipe) >= 1);
> +		igt_require(get_num_scalers(&d->display, pipe) >= 1);
>   
>   		igt_create_fb(d->drm_fd, 256, 256,
>   			      DRM_FORMAT_XRGB8888,
> @@ -1308,7 +1308,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   					for_each_valid_output_on_pipe(&data.display, pipe, output) {
>   						if (!pipe_output_combo_valid(&data.display, pipe, output))
>   							continue;
> -						if (get_num_scalers(data.drm_fd, pipe) < 1)
> +						if (get_num_scalers(&data.display, pipe) < 1)
>   							continue;
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> @@ -1333,7 +1333,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   					for_each_valid_output_on_pipe(&data.display, pipe, output) {
>   						if (!pipe_output_combo_valid(&data.display, pipe, output))
>   							continue;
> -						if (get_num_scalers(data.drm_fd, pipe) < 1)
> +						if (get_num_scalers(&data.display, pipe) < 1)
>   							continue;
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> @@ -1358,7 +1358,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   					for_each_valid_output_on_pipe(&data.display, pipe, output) {
>   						if (!pipe_output_combo_valid(&data.display, pipe, output))
>   							continue;
> -						if (get_num_scalers(data.drm_fd, pipe) < 1)
> +						if (get_num_scalers(&data.display, pipe) < 1)
>   							continue;
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> @@ -1382,7 +1382,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   				for_each_valid_output_on_pipe(&data.display, pipe, output) {
>   					if (!pipe_output_combo_valid(&data.display, pipe, output))
>   						continue;
> -					if (get_num_scalers(data.drm_fd, pipe) < 1)
> +					if (get_num_scalers(&data.display, pipe) < 1)
>   						continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> @@ -1402,7 +1402,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   				for_each_valid_output_on_pipe(&data.display, pipe, output) {
>   					if (!pipe_output_combo_valid(&data.display, pipe, output))
>   						continue;
> -					if (get_num_scalers(data.drm_fd, pipe) < 1)
> +					if (get_num_scalers(&data.display, pipe) < 1)
>   						continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> @@ -1422,7 +1422,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   				for_each_valid_output_on_pipe(&data.display, pipe, output) {
>   					if (!pipe_output_combo_valid(&data.display, pipe, output))
>   						continue;
> -					if (get_num_scalers(data.drm_fd, pipe) < 1)
> +					if (get_num_scalers(&data.display, pipe) < 1)
>   						continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> @@ -1442,7 +1442,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   				for_each_valid_output_on_pipe(&data.display, pipe, output) {
>   					if (!pipe_output_combo_valid(&data.display, pipe, output))
>   						continue;
> -					if (get_num_scalers(data.drm_fd, pipe) < 2)
> +					if (get_num_scalers(&data.display, pipe) < 2)
>   						continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> @@ -1469,7 +1469,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   					for_each_valid_output_on_pipe(&data.display, pipe, output) {
>   						drmModeModeInfo *mode = NULL;
>   
> -						if (get_num_scalers(data.drm_fd, pipe) < 1)
> +						if (get_num_scalers(&data.display, pipe) < 1)
>   							continue;
>   						/*
>   						 * Need to find mode with lowest vrefresh else
> @@ -1494,7 +1494,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   			for_each_pipe_with_valid_output(&data.display, pipe, output) {
>   				if (!pipe_output_combo_valid(&data.display, pipe, output))
>   					continue;
> -				if (get_num_scalers(data.drm_fd, pipe) < 1)
> +				if (get_num_scalers(&data.display, pipe) < 1)
>   						continue;
>   
>   				igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
> -- 
> 2.43.0
> 
