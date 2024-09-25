Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E036CCF9F6
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 21:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC80110EA25;
	Wed, 25 Sep 2024 21:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VEi+zCGN";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4663D10EA25
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 21:00:35 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5IOo012483;
 Wed, 25 Sep 2024 21:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vZnt/dELOcwFSbRyadgO3OtcTmsvLZVv+3+Y+BjymJ8=; b=VEi+zCGNro+vprbr
 qZuWWd2dlqCbhosnHcaeKQLkdw4wGiNeqDn8Ak3R5ZWQhKethSFsgPxCWUWDdwDN
 Iyrxq+Ap/0EZDTJqvvJ2aXTeZoEOGrV/zIi+gd6QIoU++z/7yMyiq7T6OaXw49f4
 a7n1Ny0dRMvcQZyGRWRe7eVQMucsN/pa8/IKak5de1gMu0IXT0W2gl26CRqMENjC
 ZRJlxzTiejVbDXnuc1SeJUZul08uBVqV6glchqMY96gG8CEEdnDtygxOD5efiHU4
 y7lLGB1geo+o6WpnlxUYH0RHXxfTny5BX7B4J+vlIflMT3yeLvLugGqyWJJLQVj2
 2s6gnA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgndw00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 21:00:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PL0PEd016417
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 21:00:25 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Sep
 2024 14:00:24 -0700
Message-ID: <75ca68fd-632b-4c59-ac3c-1756c5306f52@quicinc.com>
Date: Wed, 25 Sep 2024 14:00:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 3/4] lib/igt_kms: loosen duplicate check in
 igt_display_refresh
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Petri Latvala
 <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>, "Esha
 Bharadwaj" <quic_ebharadw@quicinc.com>
References: <20240925-igt-cwb-v4-0-e516cd1e888e@quicinc.com>
 <20240925-igt-cwb-v4-3-e516cd1e888e@quicinc.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240925-igt-cwb-v4-3-e516cd1e888e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: X319sPIlr_ZFO_Qe4KpVTPjn7nldM3sn
X-Proofpoint-GUID: X319sPIlr_ZFO_Qe4KpVTPjn7nldM3sn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250149
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



On 9/25/2024 1:37 PM, Jessica Zhang wrote:
> From: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> 
> Change the duplicate check in igt_display_refresh() so it allows for
> pipes to be shared by encoders that are valid clones of each other.
> 
> Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   lib/igt_kms.c | 42 +++++++++++++++++++++++++++++++++---------
>   lib/igt_kms.h |  1 +
>   2 files changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index f5fab7f73..a17efc364 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3286,22 +3286,46 @@ int kmstest_get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder)
>   	igt_assert(0);
>   }
>   
> -static void igt_display_refresh(igt_display_t *display)
> +bool igt_output_clone_valid(int drm_fd, igt_output_t *target, igt_output_t *clone)
>   {
> -	igt_output_t *output;
> -	int i;
> +	drmModeEncoder *target_enc;
> +	drmModeEncoder *clone_enc;
> +	drmModeRes *resources = drmModeGetResources(drm_fd);
> +	uint32_t clone_mask;
> +
> +	if (!target || !clone)
> +		return false;
> +
> +	target_enc = target->config.encoder;
> +	clone_enc = clone->config.encoder;
> +
> +	if (!target_enc || !clone_enc)
> +		return false;
> +
> +	clone_mask = 1 << kmstest_get_encoder_idx(resources, clone_enc);
>   
> -	unsigned long pipes_in_use = 0;
> +	return ((target_enc->possible_clones & clone_mask) != clone_mask);
> +}
> +
> +static void igt_display_refresh(igt_display_t *display)
> +{
> +	igt_output_t *output, *clone_output;
> +	int i, j;
>   
> -       /* Check that two outputs aren't trying to use the same pipe */
>   	for (i = 0; i < display->n_outputs; i++) {
>   		output = &display->outputs[i];
>   
> -		if (output->pending_pipe != PIPE_NONE) {
> -			if (pipes_in_use & (1 << output->pending_pipe))
> -				goto report_dup;
> +		for (j = i + 1; j < display->n_outputs; j++) {
> +			clone_output = &display->outputs[j];
>   
> -			pipes_in_use |= 1 << output->pending_pipe;

We should not be dropping pipes_in_use.

I do agree that this check is perhaps a bit outdated that it does not 
consider clone mode and we should account for it before deeming a 
duplicate but the check should actually be

if (pipes_in_use & (1 << output->pending_pipe)) &&
	!igt_output_clone_valid())
	goto report_dup;

Otherwise this will break the existing API which catches the non-clone 
mode case.

> +			/*
> +			 * Check that any encoders with duplicated pipes are
> +			 * possible clones of each other. If they aren't, report
> +			 * the pipe as duplicated
> +			 */
> +			if (!igt_output_clone_valid(display->drm_fd,
> +						output, clone_output))
> +				goto report_dup;
>   		}
>   
