Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8612CA5FCB
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 14:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5008110F422;
	Wed, 30 Sep 2026 14:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/cXZtEf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aK74A5/o";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08E010F429
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 14:32:59 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UE0KFt3943265
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 14:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=fFfWei9nuKmOicETJ4MuKmszU5VBEkD3ChLPkcowxmE=; b=Z/
 cXZtEfaWra427CM+cVeOkj/n7NXEZCJcwYyiyv8oD3x3Q8qHekQO8yZsiUPGAxIo
 fnX20RjAPWsMEWcJ2mNoouWZaTlQNBHRt1eMHehC1m1TCkuoV1mJRjb1DK3JzsHS
 u958FrNjT1U1v/6Pi+LmnCc/X0kP0GWHwaXkhd9I06YH69YwxvbTMegKS6KTk4Mh
 zZQcx+TROBOr8Cv8ws686fQNl/L5ytjyCtFa5miv6aA6jiqsuQ/T80YjEoqid0/K
 5mKWwcD9R9ypeH0HA3IcxlLb2T1FpUTBLuBwvq/qcaUSikZLiLVdg5TqZQZeg0Q+
 A9UAsHLyK3bZQ6/djZaA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bk9443-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 14:32:58 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-467c2c754f8so4798595fac.3
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 07:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790778778; cv=none;
 d=google.com; s=arc-20260327;
 b=HBrbrzY7g/IYLT8dwxK1d95qZjAHMsI+BtYEbFPWd+6wpUTAEu75UHlhsNagCig4M0
 /Utt6eA8L5jzEHGU5D8OOSz4XYjDn/2uEzcgJFWkL3aQatMzb8kqPoc2v01P6SWM9j3S
 WyZiEn0OqAVkdLJStg8odGvPKh+kp+0CUsJp6roIIGgh6MvGGvZkb8BAVK1uAuuGjj2L
 XDtFFHD9fvpfsIrcunLDMrwAvMn019zGC1/04+NRTitBcOJF0TS5u4j0Pesbjoabzu3q
 Tl6lmBMmT87KiWywoZF+9jWt/8CAYe8uiKGrbFFQEsRxce9wcSiq23vMcBgUCsxXJSEs
 Tj/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fFfWei9nuKmOicETJ4MuKmszU5VBEkD3ChLPkcowxmE=;
 fh=1VjAQ/Sf+M8kiDS4JsuDvZTBfMIPlLhTX8mIjA3fcGQ=;
 b=N2xI3rEtrKJkcM54RXAa+DEbZsnWLkTkJIMQLWTvZaLUnywmfM4A3oMcTCIqUe9/gG
 bWVrC9rx7M6kdkaBulTFDNDB80ktKv6Go6kp81GHhqKcGWJcPX6lHWrcLq4CFtSoTrYl
 BNPPWQSESXcP0TUsq264qLbtTRMjEhtruq1PWB5/HEU/Miil+5XqRjQ3IfTLThKk7H+v
 aWfOUc3VqQDQqtqrvA6ENkPBsXDKkkSy8Or43pQF4mjc9Ot644+iJqEGfmCefM+EN/Es
 g+0gLcMCb4E60J0q/cLTPzLShK5/0fJRgx5UKZ6i1Ub5hjIkhOp0/d5hhWWFXr18iToz
 jZBA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790778778; x=1791383578;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:to:subject:message-id:date
 :from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=fFfWei9nuKmOicETJ4MuKmszU5VBEkD3ChLPkcowxmE=;
 b=aK74A5/ophvnNLnugiYrwNxy8fj++cXB9C2SEZM7x8ZO/zayszMK1E771/q493vm+Z
 BJe2B8PJuD8ucodwKwhoK+VD9fH4HtLF4ESXxsQSn3mWovnmJjY6rEqwPVA4aLXhNxY+
 UCGMvWPD13PAwTqOsxjyLgl59h67E/vXtnTh5ivuXSrN7vD1orcWqphKcqw0d184ZmVU
 GG2KdHFqXD+9yEZYwhmg8ujRTm2GCXGLd2cS2xT0+3t46tsbOVLTem2/bnR1V25pvjxc
 MgWQd3oTsL8hcR81IOcyRa62AxUHAOXBsJk8LJrXJnMHw4KXb0s6OSzSAqWjuRZa3cTY
 Ah1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790778778; x=1791383578;
 h=content-transfer-encoding:content-type:to:subject:message-id:date
 :from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fFfWei9nuKmOicETJ4MuKmszU5VBEkD3ChLPkcowxmE=;
 b=Q0+ljmpPG2c3CSVKBI5u6WueYN8MtO+yXWbObFBPR+f89TLfVvMVyZ2y2LBakR8x/C
 MwwO8/xjCMb/q3vNbezTf8m9YrUAtO9FR9yEiOczM6sIj77FhP0/CZcOz0RJAk8kiO4N
 HP/p/S7rPkmdgQq/X6uk9yleW+HajN0dG1Z3UZdVGILV/PDSbynFni5A2Wltl+yKxfhK
 VK9TqGIWfNZkLtkkgjuyg6ytj42Q9ep/V7p+xjoy7UgDFj2wSSrqCxdDbRXn113IxuJb
 XAUVlO55HNKJuBpzj0du5ozfYLde8b4v8ttqC7Rxfa9gQXPumS0xxYcknHGk/kwxBx6C
 Nmbg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxgnVfJ9k4bWMJSibO+2BL3g5mlxmDBY6FmJFmvXoAF5Z+6ljDPjjKIeNubzlohnV0pZ5pw5Lwe@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJrX1KAhBpIZYOKFfb+NKwFXZvUsBA3APVzWX0hk9VHaqUepnmi
 sAwOZ4ZHPjoDz3QAcouxT7XLkHUowqd8itM73mxWjo48prip5NIScVAV4nrB7R2HwdZKN0u9k9s
 Ryoapc1IRsREgpdyUWlNDx7iFd6bnh1FofupWlQh0iMrcneaBWYVViOsX5rw3MNQcitD8ZX1ail
 1q8641mKfCUKq0Ky5L7uPSh6i1p8hWphbT+LmHi+Ojs9I=
X-Gm-Gg: AYBFou1yJPPrVXp3svfBWovtaMtpLlklf+yelfkp7CLmfz8XfDhN0gq+TmP7c6xV19V
 Linl0IjMl6uls4AGc9sFQHXo71n/sPjGg182vGdbUAAZXdcPpbMyE00/iG2L3+YsMudwsInwRZS
 0vpro8Ifa8cPQvQxnGb/XJphz/bDdGB7BtWFs4z4xI4tlMNQTVKPN0l2m3
X-Received: by 2002:a05:6871:4047:b0:475:e0a7:9f2e with SMTP id
 586e51a60fabf-49dddd4774bmr1571009fac.28.1790778778074; 
 Wed, 30 Sep 2026 07:32:58 -0700 (PDT)
X-Received: by 2002:a05:6871:4047:b0:475:e0a7:9f2e with SMTP id
 586e51a60fabf-49dddd4774bmr1570983fac.28.1790778777604; Wed, 30 Sep 2026
 07:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260929154950.838280-1-alex.hung@amd.com>
 <20260929154950.838280-6-alex.hung@amd.com>
 <20260930135508.oughyhblhcvww7yj@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260930135508.oughyhblhcvww7yj@kamilkon-DESK.igk.intel.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 07:32:46 -0700
X-Gm-Features: AclHuK9cMaxvj3FRBFLTmu0xxjpsbyGRoKGmMFhuvN36JUy9r7YHFqDDYC0D17Q
Message-ID: <CACSVV02-m8CfeU3j8zwK_3zoQJaQJugyMMxHtgb4XqK-T5yCWA@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2 5/5] tests/msm_mapping: Keep parser buffers
 writable
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 Rob Clark <rob.clark@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: e9HjcW2B6q8vU5gLQoT4bwVFSbOUawCX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NyBTYWx0ZWRfXxYoamgaryVDN
 zGesUtPGegEGc93LWTN7LzrQNGbrBnV2vp4bxUJaxZZhKZyURWt8yRT3rygl6H7AAdHkZXkJ0mW
 Pug8Jlsy0lF5gt53y0YWfNp+YZ7i4zHCJjdDgKbwiwQXEJr6pErUIEieMu3+GlQOaS7BfNcDBCx
 oQiwQdMaaa+Y090zlxMBzmgGlI4Lyk1WL4e1n0L/IkshnqdVcB2dPd8g+GVkez/TFUqZSi4+tSs
 HGBHqfqbylkatm0nYwN1W8vxN+a8WF7XYHgd6+Z4vznw0NPeqCglUUyrf8q6A4APvjNw0GV2uVq
 //qveETsAFCtUxbkYnQR1Pa+CiudPVWuvkPzZWc2Bo9Xy4E6g5okMGgOlMEGVEZwSFKeF47HOh6
 aOJ+1Y2jso6CX13Va2RaomIVPNNMdp+smQU9sWC/KDmMqo/WqG/9JXzriVbNlwKNcaL0zsKhDFb
 7v3FylnV+V0b5wdH/Nw==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abd1d9a cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=QyXUC8HyAAAA:8 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8
 a=6jVw4JUGBJPsdrRVPYIA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NyBTYWx0ZWRfX05rAlK39hKkH
 Vv/5kSBR5lQo/Qp/Yks+pQNxnojpDC8sqvk0JATqXDUQmeW8YZNI0p8yvcTRveRVMwXasu0Nj8t
 CHiT9xclsxb4dh1KKIMCY/XXvnIz0+w=
X-Proofpoint-ORIG-GUID: e9HjcW2B6q8vU5gLQoT4bwVFSbOUawCX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300057
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

On Wed, Sep 30, 2026 at 6:55=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Alex,
> On 2026-09-29 at 11:49:50 -0400, Alex Hung wrote:
> > With glibc 2.43, strstr() on const input returns a const pointer.
> > Assigning that result to char * in endswith() discards const and
> > causes a compiler warning.
> >
> > The following warning is observed on Ubuntu 26.04 (wrapped):
> >
> >   ../tests/msm/msm_mapping.c: In function 'endswith':
> >   ../tests/msm/msm_mapping.c:128:19: warning:
> >     initialization discards 'const' qualifier from pointer target type
> >     [-Wdiscarded-qualifiers]
> >
> > Keep the get_line() return value, line pointer and endswith() input
> > writable because endswith() modifies the buffer. This preserves
> > mutable access through the parser without casting away const.
> >
> > Assisted-by: Copilot:GPT-6-Astra
> > Signed-off-by: Alex Hung <alex.hung@amd.com>
>
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Also +cc Rob Clark <rob.clark@oss.qualcomm.com>

a-b

> Regards,
> Kamil
>
> > ---
> >  tests/msm/msm_mapping.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> > index 05960627c..52b494abf 100644
> > --- a/tests/msm/msm_mapping.c
> > +++ b/tests/msm/msm_mapping.c
> > @@ -102,7 +102,7 @@ wait_for_stall_on_fault(int drm_fd)
> >   * Helper to find named buffer address
> >   */
> >
> > -static const char *
> > +static char *
> >  get_line(char **buf)
> >  {
> >       char *ret, *eol;
> > @@ -123,7 +123,7 @@ get_line(char **buf)
> >  }
> >
> >  static bool
> > -endswith(const char *str, const char *end)
> > +endswith(char *str, const char *end)
> >  {
> >       char *p =3D strstr(str, end);
> >
> > @@ -166,7 +166,7 @@ get_bo_addr(int drm_fd, const char *name)
> >        */
> >
> >       while (*p) {
> > -             const char *line =3D get_line(&p);
> > +             char *line =3D get_line(&p);
> >
> >               if (endswith(line, name)) {
> >                       uint64_t addr, dummy;
> > --
> > 2.53.0
> >
