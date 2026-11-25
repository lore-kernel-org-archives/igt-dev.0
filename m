Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05A1606A31E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 21:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oZYuWPdW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kjLBsRFC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B9610E32A;
	Wed, 25 Nov 2026 21:36:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BED10E32A
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 21:35:12 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6APJB9Lg2734265
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 21:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 k956STzryGWwY0ebPp8OdMk8htqJQxJvdKqXGuapGRE=; b=oZYuWPdWtb34G9Tj
 WJ2rHejwmoCVGyGUB5gtBmEeVt+GYj/Lo7zIJASsptDMIH9nIgCXMKd/K6GcTTuM
 sbbNxoTw9pCiKj9fzePwLgNqE4BD9i/D4iszKAvf8NAeHLkSet5I4sncmt8/Cubr
 jkWIE9ldyBP1dd7C4iU+E1wJyxrObiqrmzRICuiaaebH4C4r3RzIsy1C+gQptPP8
 Eu+waI2sinyW7F1PED3GHkYw12UWZ21uvdBFF59KdcGZyMjjZ1awj5cM91UzV7hu
 LHTdCyr1vBSRqRRbJ15GmAgpohDkDQiJctwQrabRmY/HZd2+zS5tKJGp1WR/K9dW
 of0xog==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61arhmtn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 21:35:10 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-1b53bfc9534so2553938c88.0
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 13:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795642510; x=1796247310;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=k956STzryGWwY0ebPp8OdMk8htqJQxJvdKqXGuapGRE=;
 b=kjLBsRFCszYozTqs2EEXSApgWcXGj4t39zAwK80Q0T7iytiMddfnI1gaCMnJgS9Fip
 V8O2DM0h9HxxVaOY0+qyPmn4W6T+gj8YxkeHpSYvBvWie7nWnaF/6p0UoH4Bt4/nTdPG
 jikn2hmQr/h+zIv5KpLd2dIEKroIob2E0yhmgqxH7QZE+0WR3SaK0wrizbGATjDDKmUz
 MRvy8HpOSOoz1PDqL18eF7WRSi6P7gi7bHktp50d4UimliaYPG5mzTDDfb8UIDsiWJb3
 LUZ897oo41DQ/j4mkGo2jRqr/Tx7WMcOVk1aQjAvvK7/mU0Yf1bXbefREZkMmWi9Sz7k
 r13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795642510; x=1796247310;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=k956STzryGWwY0ebPp8OdMk8htqJQxJvdKqXGuapGRE=;
 b=ghhzLgs6fagOfrqf9BCVp9OatsD8CAK8R8ODWMdtrtxuUeOp8tbiuufaYfCjyC/L59
 jbdUpZLi+Cfphe0fmZbVYvFH9yoIIJm7uKS/h8kWCU9mEouN51+mRD10E0cuTGMsKXtr
 vX3412YOHMc4J9KNRulZphU469qDdp2PQYNUg7XizzNOjH0KeIyWtxYKRFK3SYuYfEBe
 g5TaftiWNwtG2NTPGB1Iv3jgwCc8qTUSi5piK3TePawoeC+dhJGxgkXwLnMwLenX6/ia
 MZTN+ehtYL69tkxVOzTEE44GWzvUe+0xklDtKCKpishjtGfL2/7lqjyqm3yl1pC8jKM6
 1SHA==
X-Forwarded-Encrypted: i=1;
 AL+hErFxD28OteuJxSrP0rJCGQhpJFDWT/J/7Ic9EWHUVtAmzwFZVuWrtpmMlyiGD0bxhGK4b0hjhz/7@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+chodNtnnIARun+eG8hUdxSCXjhc/ETkzSsD39EmMIkeJYbt6d
 L8A/nZ1Y6WZnjEyIJx25coIqAp87JO1sYa4CqafMITl4j56qEVX7qESarsHHHedvJHzZ7M6jbu2
 t4mxQaA5xr6iHJhroKMZ1eFM2vIVdXp9HYQjDm1jhvGNaKHBCRQ3BHDrllfESMFi7Zpi+E2iPM7
 e9CTc=
X-Gm-Gg: AZFdTZeZvg8oyC8IiFKTZxaiXWzO3NO9tOsuir//9jSUnm/f1UPaGgoXprcqRfUJwh/
 MPsDilKQO9V1SeD/zcMsxqcPwUry8xuyiwshxd7xJ6ZBJHYcjaH2qDhDgI72Rra6rjydBuNuhB6
 wD78VF5PKOP4UZmklkSanLr4viExJmTCvg8FwF1E3KCBg3oZ/q7vWGoMQqe8tlu2KjXt+9SQG8X
 93olOrhxY32aacvsOSMBiZC8rXVM3rmPECnoH3rum0imNfMxGumwvkt+sm147ZS4UHIDpNAxZyb
 d6dzW+063/3c4oPpLHXbMFTGPpzDy0FEMm/cITXU5e7PTWKm7QwWUNj+jvusy2Tn9kSvYUrZxfB
 chlWIID2Y+eso93U0OtabUNMNGJulp1/AUYXr7DSiVsOmJzmGCNr5a+G4yJl0D6LzF3rl+GuI+X
 4DHKQzDdTI967OtpDHmn9IqADoXQtVYB0=
X-Received: by 2002:a05:701b:2319:b0:14a:5284:1bf5 with SMTP id
 a92af1059eb24-1b55686d5a5mr16923901c88.13.1795642509607; 
 Wed, 25 Nov 2026 13:35:09 -0800 (PST)
X-Received: by 2002:a05:701b:2319:b0:14a:5284:1bf5 with SMTP id
 a92af1059eb24-1b55686d5a5mr16923880c88.13.1795642508907; 
 Wed, 25 Nov 2026 13:35:08 -0800 (PST)
Received: from [10.226.48.50] (Global_NAT1.qualcomm.com. [129.46.96.20])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b5566c1142sm43046846c88.2.2026.11.25.13.35.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 13:35:08 -0800 (PST)
Message-ID: <6a7b2acf-224e-46fa-b207-3aae59b1d65b@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:35:07 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/9] tools/drm_ras: Show and set telemetry fields
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
 <20261124213532.3674338-14-rodrigo.vivi@intel.com>
Content-Language: en-US
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
In-Reply-To: <20261124213532.3674338-14-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sYJuWiT25lzF4uhiA8MCtYgd324HrFLT
X-Authority-Analysis: v=2.4 cv=OIOyTiaB c=1 sm=1 tr=0 ts=6b07548e cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=xOnIu7kkjbAWTn-38HcA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: sYJuWiT25lzF4uhiA8MCtYgd324HrFLT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA4NSBTYWx0ZWRfXxjnQMkODJ+ML
 ufXPwKcj7UJ0oTnS6IMfNuX6yXvncB9CZ9/CiKdw0o+AMoRF7IzM6mZwlgRigz6XR8cZvqDB6TO
 ga2VBatXsnwyB3mp/ss4Lmg5Kbmo70o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA4NSBTYWx0ZWRfX87bjY1LHixCA
 YNrmLrBgwADIEW4qZ27AUso8hwLA1+644qBfeuL4EDtVqBWHGkF+b2n5yAJkBgO8QUkL4oN4mf7
 33KHqtphd/7jzbmHsNj/Yn37ZcD8y6Bnq1KQmp/dP9UxbIeecIj157IHAj+9JRfd29sPEYvHOJg
 DKkONpA45ZlVg5ebDLnbuqq40BRzPz98osOYjCR4Q9xyimhOTYBz+mFrs+ZfKAEhEY1rcmaFMtZ
 NDW/1je0lVG+n6VFT4BP3cv9afDiIHIwh9jeS9bd3jUTWfHjndxNx59FoaE0Bi26FOUm6ACZ98q
 PlDJUzwvbwxX9AtZ3E88eagtSCZqBmF+xF1XaaQC/bB23PgYm6Wz36Ec2Rnocmg1vLHixIKw9ZW
 v3Sq8jt4TFxFMNsQ+m8d8gicr/v6HGYQaVVp/5BjPTAZx1MGcmv5hbRLciXbJyhot/Zw2h2BlRK
 rXxVWYk5b3+exo67xXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250085
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
> For telemetry nodes, show one line per field with its ID, name, access
> mode and, for readable fields, its current value or the status reported
> by the device. Add -s <field>=<value> to write a field:
> 
>    # drm_ras -n <node-id>
>    # drm_ras -n <node-id> -s <field>=<value>
> 
> Build-tested only, no telemetry device was available.
> 
> Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
> Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   tools/drm_ras.c | 115 +++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 109 insertions(+), 6 deletions(-)
> 

[...]

> +
> +static int show_telemetry(struct igt_drm_ras_nl_context *ctx, uint32_t id)
> +{
> +	struct telemetry_fields fields = {};
> +	int64_t value, status;
> +	int i, ret;
> +
> +	ret = igt_drm_ras_nl_list_telemetry_fields(ctx, id, add_telemetry_field, &fields);
> +
> +	for (i = 0; !ret && i < fields.count; i++) {
> +		const struct igt_drm_ras_telemetry_field *f = &fields.field[i];
> +		int err;
> +
> +		printf("%" PRIu64 "\t%s\t%s", f->field, f->name, field_mode(f->mode));
> +

Nit: Would it be possible to have some padding between the name and 
value/status so that everything is aligned? As is, it is slightly hard 
to read.

> +		if (f->mode & DRM_RAS_TELEMETRY_FIELD_MODE_READ) {
> +			err = igt_drm_ras_nl_telemetry_get(ctx, id, f->field, &value, &status);
> +			if (err)
> +				printf("\t%s", strerror(-err));

If telemetry_get returns an error, this indicates that something went 
wrong on the host. Maybe update ret = err here (not sure if an early 
return fits as well)? Then, just have a check for if (ret) before the 
for loop, and you can drop the !ret check.

> +			else if (status)
> +				printf("\tstatus %" PRId64, status);
> +			else
> +				printf("\t%" PRId64, value);
> +		}
> +
> +		printf("\n");
> +	}
> +
> +	free(fields.field);
> +
> +	return ret;
> +}
> +

Otherwise,
I tested this on a Cloud AI 100, and the telemetry get/set behavior 
performs as expected.

Tested-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Reviewed-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
