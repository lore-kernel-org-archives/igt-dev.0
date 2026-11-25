Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53BF606A337
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 23:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BV4T3JOx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UpJdBuQX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF2511200F;
	Wed, 25 Nov 2026 23:30:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDE311200F
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 23:29:13 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6APJBBSd1794793
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 23:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 q3g8HKIdBgxyo1ruVDRy+ufiv2VcovXTOdqBn9SDBFA=; b=BV4T3JOxfvgmEAxq
 yVmqMq73C0M/mbbKEn/vV2TAHGeS8YY3nU5wLZteazjDc8jiijca/8P5LTLyrHhR
 SM4wl7zo94phHANOkeBo3kZ3q39VnsJrYYg65QzDqyCPbOwol3Xip5RKkob+T1I4
 1aii6Pwn2/a+jQjzhjaNpjT3nYhsUDFSRVJC7ES5k+UcDujoV4m1WvwcXaEFYVah
 XisTZ/rPsla/lLcA/FSpIdJBLbE3d1s9Euefx0iJ5idWW+W6Z461Nz5pKnt7bgax
 UBjZiyZyRbza0QBbEHd8V2l35JKshbKdovA0Qdi/3wEKPLZ688jm8icRCIFVSrRU
 HlAJ3A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnu3tk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 23:29:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-38355b03cb8so6006904eec.0
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 15:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795649351; x=1796254151;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=q3g8HKIdBgxyo1ruVDRy+ufiv2VcovXTOdqBn9SDBFA=;
 b=UpJdBuQXUvyDbpYzgjo0VHuVLNMkBYPU6Dzg6Qk5QYuzDCgMOy70t1uiV+1KdcHX7x
 34k+eBld0Knr2U6HGfopTzh8VYlMDMXeWdq363hoW6j+5JRLQtTiCJK3B5F3gk4L36Dv
 NMObE+/SYkYBfgkGoMg4Hz7qeQ7StIWiGvNtUjW3ubiXdlqmN/Y1lps8Up8kl4PO29CM
 VGQ0mNc+mxfFetVFTHldw7STRSPtKIbAhFUAly/72tNcHzGgLgUrHWp19KB3Mdy4l6Ze
 c3W/HoF32wN3lk/4pO7DXGkLaFMN+N7UNN2Ql2WQWOyHrG3a1U41+lY2FFYmMhnRuPuW
 XvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795649351; x=1796254151;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=q3g8HKIdBgxyo1ruVDRy+ufiv2VcovXTOdqBn9SDBFA=;
 b=tJFkHIz0oyP368Y3Is5yF42NeFyLnTP0PHMPsFcMZEQCifD1kIXVqfy7nh8qYwC52G
 UMdRA6phqCyMIlRvMCQ15YDa99F9yrgirn7Qmkb/Vp+6vxnStZvWrAKMlWNbxypbw5SZ
 nFqFOvAwA4l96eqRnLVCu+XYWuOy+vNn+yKgAHGldQXrq2xvgh39RExptA1wMbNoAXzU
 fTkXPyrptDlnBRhOdBO9RDL1NzHVYaRSjk4YtMPEGe5GWl96kXU7HaaaOXQFfi2zTd6M
 wjJtCpyQIoaofBQw/2uEgyOiaRmWYTb8RnSzlYOvAeHpoKin6RuTf2MdHrlYUn7YthvL
 6ANw==
X-Forwarded-Encrypted: i=1;
 AL+hErHjRO4HmVhNqpIOyht8dBoyXArKtLZY66CSiOcP1eSrOz7dVFi+qy76RlX0zCtdnLpgcemiwtDR@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8hHRhNBHYOJvVc8CV6+PFazWUhNpGSLUi2DbBtg4w4gNk8jDEQ
 MWofAwq1gz7xLcJjmjFldwxd52ORz2tBxS7Pl128o8fBhWgLWP0x3afACzEYDVLo3QsOVoDgLCW
 2ha9Sd1x2ItF/wMNzaTTwEo3BvUsbxsXHcQzi6RZJqcXZUH8Wr8hencD0+o+bx84oVFXD
X-Gm-Gg: AZFdTZcLPI2JJa29OsFNIk7QNKsHfhcbNOv417JG2De5rTjdRHXWd+vIxT73PbSYVNR
 y1bLgqa+5bYMnlXPa7Dqvola5PfpnXtGhQBvBeQP8gHJg8FdqA+VfXzWVUE+rernDtw9sDf5Bvc
 zFRwrdByI1/O0dTWN4RnCuCtCr3OjL9kcdLN5oAQ4+OTEHsSNN+/50eF7rHM3oZ1imiGS46mXQH
 iimKRPHb5b8yhWaWSbRHpJqxIUG6qV0KFrp7SlMZL+0gZHgaxPnmQw5zxC4P9RHDgzTapkxTB1y
 CY3nFxLPWC0beSBDawQJdYocRN5YDYRYxchNKw4NFyQUgo4DV64i6Jm3p9UlkLNvnMBkddNMp4a
 bN55HOvFp7RuFt0r37gGYBPg9CPuKBetFP1pM7DU3YTrWY5/yT9vDjkGQXeh24ouucrcmXYA+4t
 OfT2ny/XK9FRq0yrTJlbiXltUZqkzu7VQ=
X-Received: by 2002:a05:7301:f02:b0:386:a3a1:6f24 with SMTP id
 5a478bee46e88-386a3a17d5fmr14121251eec.24.1795649350871; 
 Wed, 25 Nov 2026 15:29:10 -0800 (PST)
X-Received: by 2002:a05:7301:f02:b0:386:a3a1:6f24 with SMTP id
 5a478bee46e88-386a3a17d5fmr14121227eec.24.1795649350257; 
 Wed, 25 Nov 2026 15:29:10 -0800 (PST)
Received: from [10.226.48.50] (Global_NAT1.qualcomm.com. [129.46.96.20])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-385672c6f31sm55286286eec.15.2026.11.25.15.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 15:29:09 -0800 (PST)
Message-ID: <470ba9e6-7c6b-42c7-a629-b41d7e8f9d7a@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:29:08 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/9] lib/igt_drm_ras_nl: Add telemetry helpers
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
 <20261124213532.3674338-13-rodrigo.vivi@intel.com>
Content-Language: en-US
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
In-Reply-To: <20261124213532.3674338-13-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA5MyBTYWx0ZWRfXxEqc5V8iDI53
 JkXEbgWGDEju8+GTEAhdt1B63FGSoGgz+ZBmF6GRf8+ZEn0dFSA/V9ROoM/jnYrRQj1LC87f6bh
 AYGI5lGrq0ShQqhtrPgf5/lj8Tal6bu+56+QeVI2Bt/AfBO3MN2uFzUC30uyUK3m6xR0eT2ukY7
 cFIhbCLQp6cwntrdBe8vs+jygbzl116O23BLIvTIHtXwkHe+bPQF2IqvRIu/CSPHVDcrqXpMmt5
 2DB7jKSlXN3ItZdXYjYolGrw6sWbIlkiswWVozvpZRz1tJeNXQ+oAphokim9foB8EWAlqzTpt/o
 eZ5Rk2SAEpbunirlrGjzmbZCboqA0/YWlLuT9s90dp2X/VLKEoafPbz66DI+GhLLpEhW2qFjgG/
 AFFlWn9GvL1+yqgILk75Edr/xsP2IzlCi4Vi2enKrikeDKEHNDVVDt3rJom63YUXhn+puZqzTwZ
 DgykvQ+UEU9jJnoTeFg==
X-Proofpoint-ORIG-GUID: GD3xE1p3gEKGTT6D4iYzTqSqEeqgW9Lp
X-Proofpoint-GUID: GD3xE1p3gEKGTT6D4iYzTqSqEeqgW9Lp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA5MyBTYWx0ZWRfXwf1ruKc329iX
 +BQg+e1yJ7MMX3SKKOOwWFhGZvWnZ/BVilL76YHiRe9pWIMhH9xGfc5rvsJF6fVl3G9HB9aetzL
 HX3yw4KGHh5xgQl84CN0uvsdtW1B7kM=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b076f48 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=1lMTfZdE2LKoQOtY96QA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250093
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/24/2026 2:35 PM, Rodrigo Vivi wrote:
> Add igt_drm_ras_nl_list_telemetry_fields(), igt_drm_ras_nl_telemetry_get()
> and igt_drm_ras_nl_telemetry_set() for telemetry nodes. The request
> helper is split so that requests can carry more than the node ID.
> 
> Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
> Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   lib/igt_drm_ras_nl.c | 194 ++++++++++++++++++++++++++++++++++++++++---
>   lib/igt_drm_ras_nl.h |  21 +++++
>   2 files changed, 202 insertions(+), 13 deletions(-)

[...]

> +
> +static int64_t nla_get_sint_any(const struct nlattr *attr)
> +{
> +	return nla_len(attr) == sizeof(int32_t) ? (int32_t)nla_get_u32(attr) :
> +						  (int64_t)nla_get_u64(attr);
> +}
> +

Nit: maybe put this next to nla_get_uint_any?

[...]

> +
> +static int telemetry_request(struct igt_drm_ras_nl_context *ctx, uint8_t cmd, uint32_t node_id,
> +			     uint64_t field, const int64_t *value, struct telemetry_reply *reply)
> +{
> +	struct nl_msg *msg;
> +	int ret;
> +
> +	ret = request_alloc(ctx, cmd, 0, &msg);
> +	if (ret)
> +		return ret;
> +
> +	if (nla_put_u32(msg, DRM_RAS_A_TELEMETRY_ATTRS_NODE_ID, node_id))
> +		goto err;
> +
> +	if (nla_put_u64(msg, DRM_RAS_A_TELEMETRY_ATTRS_FIELD, field))
> +		goto err;
> +
> +	if (value && nla_put_u64(msg, DRM_RAS_A_TELEMETRY_ATTRS_VALUE, *value))
> +		goto err;
> +
> +	return request_send(ctx, msg, telemetry_reply_cb, reply);
> +
> +err:
> +	nlmsg_free(msg);
> +	return -ENOMEM;
> +}
> +

Should reply values be initialized before the request is sent? If the 
caller doesnt initialize *value (or status) and the kernel doesnt 
include them in the reply for whatever reason, *reply->value wont get 
initialized in telemetry_reply_cb.

In the next patch 5/9, igt_drm_ras_nl_telemetry_get gets called with 
references to uninitialized value and status. If we initialize them (eg, 
value = 0, status = -1) before sending the request, uninitialized data 
will never be returned.

> +/**
> + * igt_drm_ras_nl_telemetry_get - Read a telemetry field
> + * @ctx: initialized DRM RAS netlink context
> + * @node_id: telemetry node ID
> + * @field: telemetry field to read
> + * @value: set to the value read, only meaningful when @status is 0
> + * @status: set to the status reported by the device
> + *
> + * Returns: 0 if the read was performed, negative errno otherwise.
> + */
> +int igt_drm_ras_nl_telemetry_get(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
> +				 uint64_t field, int64_t *value, int64_t *status)
> +{
> +	struct telemetry_reply reply = { value, status };
> +
> +	return telemetry_request(ctx, DRM_RAS_CMD_TELEMETRY_GET, node_id, field, NULL, &reply);
> +}
> +
> +/**
> + * igt_drm_ras_nl_telemetry_set - Write a telemetry field
> + * @ctx: initialized DRM RAS netlink context
> + * @node_id: telemetry node ID
> + * @field: telemetry field to write
> + * @value: value to write
> + * @status: set to the status reported by the device
> + *
> + * Returns: 0 if the write was performed, negative errno otherwise.
> + */
> +int igt_drm_ras_nl_telemetry_set(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
> +				 uint64_t field, int64_t value, int64_t *status)
> +{
> +	struct telemetry_reply reply = { NULL, status };
> +
> +	return telemetry_request(ctx, DRM_RAS_CMD_TELEMETRY_SET, node_id, field, &value, &reply);
> +}

Otherwise,
Reviewed-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>

I will be on vacation through Dec 4th, so any further replies will be 
delayed.

Thanks,
Zack

