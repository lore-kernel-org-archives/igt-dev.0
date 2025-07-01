Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E90FC8303F
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 12:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D18310E6F4;
	Wed,  2 Jul 2025 12:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KD1Q1LAc";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0226B10E5F3
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 18:01:20 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561HKdLk024797
 for <igt-dev@lists.freedesktop.org>; Tue, 1 Jul 2025 18:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=E08Ymkj00isvwn8MFFMgxGIKeBNJqDWH0W0N9Cm+9UA=; b=KD
 1Q1LAc0XLplbVj1vNa4FXTpyujgdndAXSVEbt6da9gUp9KWaXfonB1GqhIRGT+GZ
 eU7r9KrxKr24PeRtPAkh9trvz0KRVNC/iikLDqbJXj2FATGXHI57PG/ZzWaQllmQ
 RupCf6ZKq0oOA/tkE8Ly3iipIMXBrd5UCLUODgcV+SG5QTPYCAwxVrZgb16HMfi7
 Zrs5ZCfFZ+GMXCocetTLCZ+MKt/ApCL0lrh9/d21UKV9tUhauaXptYuaqpxEL2TJ
 DpCXbfzqgdfgq3sN64utbsv07MkS6tD++dRD4hJCwVy3zymv4BnBIXr0gjLqiufR
 PFOPaYbSmQcei7xelXLg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9hvje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Tue, 01 Jul 2025 18:01:20 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-40910997080so1026154b6e.3
 for <igt-dev@lists.freedesktop.org>; Tue, 01 Jul 2025 11:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751392879; x=1751997679;
 h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E08Ymkj00isvwn8MFFMgxGIKeBNJqDWH0W0N9Cm+9UA=;
 b=EbPoGYurYJJEtGLxKf2q1/Att3shX0UZ6xbJEAHYVa6JH4GP3PVC4KTlznwByGfST2
 04MJUzyzcoID5SNwKGON/QF4+K+CRmTlB2JnyffOgiJiGTUVqzw0f+HR/59aXvEd7KTC
 4D5i/dQns0Lc5f3Vbw/X7uxrJhoHDdXmu7zL6A/LAqZHK0EyoyU7uKMkedC4SV27sHri
 5Ht6mPNV9y3NtvbXMLo7Hfa4YxPNAS8kZrcZreRQHSkWTG+HWV4Ll4QLYqksTnSR0vz/
 6/jirUoXfEUw0X67zuwXEHLcQ2u1CkB+NppqA30mXh7tXmsYojmhNToVHUaKKbMfTtcK
 5uMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeiE2pDw3X+2AeFFvUkevqlG+8hwhZVaf01fhj8fYCbz7KyrqIVIWn5dguCW3hZHpabXA0Usuk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWwJccUvxcOzZwnW8cJhJoBplu71qbulLRDvf6TprTCA5xUpdf
 P2OL5pyXv3P/1fzz6C8qHiaFH6ITBj/IDmMfNQSK9P9PWluXw+CGGTZmSjBDVl/OlmJHTgYzn8m
 klyort3Ce2xbYe+CH1LCZARxRMj8lTiigYDUl1jw9wzxUwj2NjwjshBW4afHJj9z9A/Ba3oEosA
 DlPQVNt4PS2MpuJFWgKldiPiWtxVrBKiMm0nYC9wPWSg4=
X-Gm-Gg: ASbGncsTOd/awmkrEAeAGa6+wQrLmLWKX2Ir6a3NeN2Rgf9PmKl9ihNO2UjSk6ze05r
 0OALR12C8Xb1wN+Aqw5xbJy0OgK7j0O509MEvP9VKCs1Zvg8aPC9fGDZt7X8O95HIEfcgEsBhoV
 u7gSdwy9VLI9/3Iu8vpXDc+DIIC79RJtwsnMw=
X-Received: by 2002:a05:6808:1208:b0:408:e6e0:910a with SMTP id
 5614622812f47-40b33e1abd7mr14971059b6e.22.1751392879071; 
 Tue, 01 Jul 2025 11:01:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjqhhJ9WPCGNh5gW+/pqNz4sabEQdLdPjloNPnyLQIyPDtO+reo3m3if0HiBql19pnlFP8rHqGr31iAL5Le2I=
X-Received: by 2002:a05:6808:1208:b0:408:e6e0:910a with SMTP id
 5614622812f47-40b33e1abd7mr14970999b6e.22.1751392878425; Tue, 01 Jul 2025
 11:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-8-robin.clark@oss.qualcomm.com>
 <20250701162114.5gkdr7f5cww23ou4@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250701162114.5gkdr7f5cww23ou4@kamilkon-DESK.igk.intel.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 11:01:06 -0700
X-Gm-Features: Ac12FXyEkWfkw9gSLZbeNFdYURWOCDuIIzied9_JpHK7kcGSUVi9eXBW_4H2Y1U
Message-ID: <CACSVV02jA9dFUFuaKAmoOn_wav0V-QrTj4vo6Krr2V4n7MRDKQ@mail.gmail.com>
Subject: Re: [PATCH igt 7/9] msm/mapping: Handle larger gmem file size
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <rob.clark@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68642270 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=_LjFwpKmhB6XmTo0UT0A:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: lJb-JxI2E0qa4fPDIwebmZl0blDHc8DP
X-Proofpoint-GUID: lJb-JxI2E0qa4fPDIwebmZl0blDHc8DP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEyNCBTYWx0ZWRfXxvR6qEkmOQOC
 NibFSElWmsEINOSggJBtstz/asJOYvnFHA0u4ykU+yCLDQmAMArMvXfHTa/ck45Qt7MtFibgYsp
 yl5eb3WadC11GrcO8mNUm/exP/aXsflZpEXzpUMrpT3rSNRd1PSwJAPg1lBiPtZE4DWuFePGLKZ
 1etnh+zJDNr9tuo7sWL7G4+vO5c0sK1nOPeTvxPh1fsvRZmMu1PXaujf/AB1FMT8sSTRW8kKwbk
 YqUt2v/s/RHaw2BFsWLMlT7uipAeM3tNqbG50FdGGxzIbhSAi1k1IxV8KyAlJi/oDLBW32mGNaO
 5okCboN2HlVPuI8u3CSq4qEceyUym4JTZ5JlK5NKf+ypEIR3ajOO+KGxiRUKBGaKf/DQaS+TTvI
 4cPSwpUwHyFYKiK0h5tIt0kzj8BlUYr0+dEOxmJ8OOnDBI2xkbI/eJeaHn1zB7rpQE9Ga75O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1011 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010124
X-Mailman-Approved-At: Wed, 02 Jul 2025 12:18:00 +0000
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

On Tue, Jul 1, 2025 at 9:21=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Rob,
> On 2025-06-30 at 11:09:01 -0700, Rob Clark wrote:
> > From: Rob Clark <rob.clark@oss.qualcomm.com>
> >
> > If running on a system with full desktop environment, the file will be
> > much larger than 0x4000 bytes.
> >
> > Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> > ---
> >  tests/msm/msm_mapping.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> > index 03a9e814c931..978ea18375dd 100644
> > --- a/tests/msm/msm_mapping.c
> > +++ b/tests/msm/msm_mapping.c
> > @@ -122,7 +122,7 @@ endswith(const char *str, const char *end)
> >  static uint64_t
> >  get_bo_addr(int drm_fd, const char *name)
> >  {
> > -     char buf[0x4000];
> > +     char buf[0x80000];
>
> If it is that big why not malloc() it?

in kernel, for sure.  But userspace stack size is multiple MB at least

BR,
-R

> Regards,
> Kamil
>
> >       char *p =3D buf;
> >
> >       igt_debugfs_read(drm_fd, "gem", buf);
> > --
> > 2.50.0
> >
