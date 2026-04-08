Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7F910F995C
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 17:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DB010E6B3;
	Wed,  8 Apr 2026 17:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQdzsiWF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J86mGUfw";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D33510E6B3
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 17:46:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 638B5dDf1314650
 for <igt-dev@lists.freedesktop.org>; Wed, 8 Apr 2026 17:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=6Zt13AleqxQRMUlabs51Gwj57LTyaOLmTFx8kp3G8cg=; b=PQ
 dzsiWFosteLwqY0FYaofLWhR+w4EVOROHuMCRe3omOsRZMSjRVhQV09lYu1TJvWn
 Y7UJZUQNIkW+xviq0WKk/F5iZySSu+hx8HXk6PlP1sCM9Y0lq57vcOSjC4KLMLK7
 sEibAitDzQo8tUAf5WPqZZQkZDVSpdewJnFrpU3pC8UwraZNDgtEC67pEMX8VEYd
 yivzz5H4W38nsCKSl8shLlBcPHVON1gMvPx37Gm02Lb6N5axVxYBXNF90sijuqjT
 wwsr5UZeIOADwRbw7/5tEMPRI9gRpjtKGmChnzk1W+6l7UBoWDK7htpD5TEF39WH
 xUTQ00fsIa9jjUZgaNzg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd8d6mcq0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Apr 2026 17:46:17 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-42394108a90so48596fac.0
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Apr 2026 10:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775670377; cv=none;
 d=google.com; s=arc-20240605;
 b=B9YQ+IrV309i6gbrld5RJcJ2lqTgdsYTHcPbhNyNlSENPCBXzlRBqCJPhKFlF5+7oZ
 FeoJXyURKnbeSIiqg5sxqTMFhagnksFf2vS8rerPls7rfME6vEuAJ9AHm4xpKA8VCCWg
 wQkfC4ieC0nJOi4d9wsKIe2jglRbbu/L2CmLhYAfeXzoxRUDhAJDDft4f9t7nDSy3KUp
 OnTguJoqmQOJ4qRjJbiSpiaIk7ogMQtig5xy2XROv+a73PULFeAgZuvaphPyuPtOw859
 PeZcI2gj86UUpuQXDjPfhQCTXBkIOmlep2pDqO/cSbm5t8hA6iEZxs+1WbhSCyz949Le
 Tciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=6Zt13AleqxQRMUlabs51Gwj57LTyaOLmTFx8kp3G8cg=;
 fh=xd5fd/IxK5YGmvVVK6x249rf394MnXy9bK1FHluBuVQ=;
 b=iBRMFYyYWXxmGtzX+1Mienskhftop2x4iBzCF0py6GcfYYkKAU0CJIvaddHmHygU/z
 vBEfIA094z5ga0s7iuxJ8utkQ2AyapzS+gIpi8VM8WlO9ZLgGTjFIhgDlHiZGeUiQXOR
 RKMJixvh9WyG/lWEpodVO44ueB/V9P+NVEv9dIgZ/QoTopVqL1wiGrXCc6T8ur7sk7dY
 zHS8iWCDSXTN+dnoFeEEHpLSZ22e4lbk/2TU2f5eh9bAonuCSKsakNNq/3cbVgp0Vr15
 tMMRQu/BFkqgY021MDGd5K08yupQOVTrWoNp1Ev2OgvdGXbWLAH2ZzKnFRyrvVgVZgZA
 fTOw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1775670377; x=1776275177;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6Zt13AleqxQRMUlabs51Gwj57LTyaOLmTFx8kp3G8cg=;
 b=J86mGUfwrsvHmrPSkRPhWVNT3y89OEzgIHhS9NuDVvQNBB95GNnWcXVmrDYnJCUv6m
 q+WXKH1j7Sm9exRL3xrHiOZWPl/ekNEJyqeBjUSQghu+5QOeenNwqtPaFzniUzOHvSeK
 Ti+2I9+PzqE6gMxhbzYwdguvRt6zXpgS3xsi9q+DYhMXFz+j52pa2ypr1Lw0w6jp8y04
 pFVl+O4omeZxII6II+EO17BNp2jVe0JGOx/PjsVogYXB65BuqiZQXNm/JYYi9tB/As4c
 bogRRJffuuSKfkcOJxuIAzBIWh8bGqYKs2DRKD/n9TwIg0N3Xf7ntc4+QuzbTpSqCd3V
 j9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775670377; x=1776275177;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6Zt13AleqxQRMUlabs51Gwj57LTyaOLmTFx8kp3G8cg=;
 b=jy9vgtO2YI62L711dEMg2VW3TQ20O7QkPHkV5qVwjnQto0td8SFsmIHNbuBPgqHP3v
 oGrITFHuWJ6eU6pOiz2z33O37VUcbFA/eKStQt/ZnHDNcj9SaBrqZCLhT2wUoNpClVSu
 N0fSYnA1GHvAUcUQxNfCJO6yG2VnFj34obO5CACbs77LnthJXPd4z5KH/SUX6skUIAmT
 S7PgwSIYaEyptQvrzerrrc9bdAqc0lr/Mn3VyUohV9SkS9FpKtxFx+msaNilsNN0zS2N
 cq6PJ8dO7N2yiS96H2w+E9k/nl1Wu8GDRsUXQhXiReJ/jZY7gfYMnY+AxpPQbjVkYwCN
 EKhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6BB++zLCzp7KHzzep3W1OkymKB8iT9NpwGAlPgLesPaqSvCQpM5z34K1GOtzdJbS3dIRodBG5@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzqw/w3YGVk6GFBnGmKSvgmf6+7om3WGo6FODT502BF1Kdt9zKe
 gDQDwBIoxnFQVpxzw3AyCTHuY+XD/asKnIBF2zCq6VJFe4rRaIr7bSmO0W6svsXNkwWsVgG6YBL
 QHXLgxrxBFVKDc5eyTeAeMffdJC4L1UlZdmN/uCVKmPuELjH9I8t9bzXMXXvoazKYTy8OD1SrtC
 h6oqPwbWci2fUNkTecNTGICtRkYSUWLu+JKLKg26qGrJs=
X-Gm-Gg: AeBDietL/xEuq+7zUwJOQspXgou0tTIE8BvP8BjVfpZXYf5SAQ1nP//QML4JaN04yCF
 t9ccJnwA6LJ9oXx1P8q/4YQh3/GM1irtGf+Mdz3G+OVRb57BlZuHX34NxD3fQxtRWaHcnpJ+Wxa
 /ABpx0DfqTHJvTQfSYezOLrV6FiF/yxL2mo2XAnE56Tkokpnv6KUzhmkw6mhxPEt62fbmh8m046
 tpaKAd2rdgswG2Eg6K+vejwPISZdRbjmij+Sw==
X-Received: by 2002:a05:6870:f203:b0:41c:954d:6ef7 with SMTP id
 586e51a60fabf-4230ffc21eamr13198516fac.25.1775670376880; 
 Wed, 08 Apr 2026 10:46:16 -0700 (PDT)
X-Received: by 2002:a05:6870:f203:b0:41c:954d:6ef7 with SMTP id
 586e51a60fabf-4230ffc21eamr13198500fac.25.1775670376431; Wed, 08 Apr 2026
 10:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <8e61be678da46c7ec762d9d4c3069ce141d7aea1@intel.com>
 <20260408162505.2131099-1-harshdeepdhatt@gmail.com>
 <910f940a2aa6ba76976e9b8d1eb4c7171c3a1a05@intel.com>
In-Reply-To: <910f940a2aa6ba76976e9b8d1eb4c7171c3a1a05@intel.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 10:46:05 -0700
X-Gm-Features: AQROBzADXf-lacSBR3vE2uS1h5-iyERvF5QffqOAz-LklSuhEyZRUygCgVHMoF8
Message-ID: <CACSVV03Q3Szz01PsJL2rGKwQRPr60RUkH17XcRzVghkmS3Ze+A@mail.gmail.com>
Subject: Re: [PATCH i-g-t] lib/igt_kms: Identify writeback connectors in msm
 driver on android
To: Jani Nikula <jani.nikula@intel.com>
Cc: Harshdeep Dhatt <harshdeepdhatt@gmail.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, igt-dev@lists.freedesktop.org,
 lumag@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: nQV_W2f_9dxhabG_zjKDwCqfY-fr5wqz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDE2NSBTYWx0ZWRfX3Bd+w18pyjmo
 SSxfcIUFF9dhdvNk0YegLScs56wtxXj3KcDz238E/ALNvlBDK0w63+D/KvLOrabtnfAKLknF+rg
 XLQnUPPKpfRwd1L1Bbd37woLjsgIjBjCRVQxWU/OUvxi6vc2zzuVgSy3XsnOq0o4ncO/JyEPswH
 VpML21R1aoZC74kvDpJAsfdt4xvI8g9xbSLkpdyDOzqshclQ2GVACG/MU5wcoPRXgA6JdWDCiDg
 zPHWH16GG+0WIDwf9NdfXjB3E0ug56OBlD0C3lnx1sTWVNuFQdcH4zp/hOmQejfkfDowaUdJUki
 aGL/Hohlxqy64JGWz8EL1NyYG3UEnrtcdYEMaI017tXqcj0banVgjl7INwo0gZIwx89jmO5C672
 G33lr8h3wLuyXa7thsY02RvfN7q8Ic/U7Ud8M53bUNmzBNX7GBjKHGR9DC00rbtzxUCpNcLpEax
 QyJpc45/YOq8o15Mw+A==
X-Authority-Analysis: v=2.4 cv=GN041ONK c=1 sm=1 tr=0 ts=69d69469 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8
 a=PY2Z5it_34zXwtdx0ZMA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: nQV_W2f_9dxhabG_zjKDwCqfY-fr5wqz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_05,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080165
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, Apr 8, 2026 at 10:21=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Wed, 08 Apr 2026, Harshdeep Dhatt <harshdeepdhatt@gmail.com> wrote:
> > Thanks for the feedback.
> >
> > Yes, this quirk is specifically for the downstream MSM DRM driver used =
on
> > Android devices. The upstream MSM driver does not need this, and the in=
tent
> > is not to modify or affect upstream MSM behavior in any way.
> >
> > The goal here is to allow IGT to run on Qualcomm-based Android platform=
s,
> > which currently expose writeback connectors differently (as VIRTUAL
> > connectors with a custom "FB_ID" property). Without assigning a writeba=
ck
> > FB, the driver rejects the atomic commit, causing several IGT tests to =
fail
> > early.
> >
> > All of the logic in this patch is fully isolated behind detection of th=
e
> > downstream Android MSM driver (`"msm_drm"`). Upstream MSM continues to =
use
> > the existing code paths unchanged.
> >
> > IGT=E2=80=99s documentation states that it aims to be a universal test =
suite for
> > DRM/KMS drivers on Linux *and similar platforms*. Supporting the downst=
ream
> > MSM driver helps extend IGT coverage to a widely deployed class of devi=
ces
> > without impacting upstream users.

Without weighing in on whether igt should support downstream drm
drivers (I don't have skin in that game), I will point out that "and
similar platforms" was probably intended to refer to things like the
*BSDs which port upstream drm drivers to their own OS, rather than
downstream drm drivers.

BR,
-R

> > If it would be preferable, I can restructure this into a dedicated
> > =E2=80=9Cmsm-android quirk=E2=80=9D helper or move the detection/handli=
ng into a separate
> > file so that the core paths remain untouched.
> >
> > This keeps all non-upstream behavior contained in one place, avoids
> > polluting the main code paths, and provides a maintainable structure fo=
r
> > any future quirks that may be needed for other platforms. Upstream MSM
> > remains unaffected, and the quirk only activates when running on the
> > downstream Android MSM driver.
> >
> > I=E2=80=99m happy to adjust the approach based on your guidance.
>
> Cc'd some more folks.
>
> As a contributor, I'm not very fond of the idea of tiptoeing around code
> in IGT that caters for some downstream vendor kernels. I'm not going to
> go hunting for those sources. Hardly anyone will.
>
> I'm not an IGT maintainer. I'm not making decisions on what is, and is
> not, acceptable new maintenance burden to take on.
>
> But the maintainers do have a decision to make. The options are to
> support either 0 or N downstream kernels. If you take one, you can't
> reasonably refuse anything after that. Even if the patch at hand is
> benign, the precedent it sets is emphatically not.
>
>
> BR,
> Jani.
>
>
> --
> Jani Nikula, Intel
