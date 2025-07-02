Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BD3C8303D
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 13:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D574610EA4C;
	Fri,  4 Jul 2025 13:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkFrX/Gg";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A330D10E1C1
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 18:41:14 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562Da0cG007067
 for <igt-dev@lists.freedesktop.org>; Wed, 2 Jul 2025 18:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=HDOAgqdvnMBZZpEZh4yzmK9zvBDjP1rjpUfSRdH7hCw=; b=Sk
 FrX/Gg0dwHJqHyDbE0E8ULyCsd4b0lUiEir7Ft8TO576Lwo8oVuuz7L+oSU0S2gk
 HnXVUtXx5JVxH39dyeIwiP5RtUC1xytT25ZmLxc7g2WKWe3GPmiJqW+hiM2e1vwp
 tDYejg6CX7AuZUas9xl2N4dK3yh2VnOKMahqHTyEj5FiHHEgR9dUyM0jnIosyfXZ
 IYtl+1ObKMRrtbCUOc800NxOrjEE8GOB5nKJjAei4rJFR9umV2DklEgnpqNHM73b
 Q2XFkBfGVtdMcLbmSwLzPhPJblA2JdC8niGs5EYPO7PFehkj/sUGY2SvcVMUhhDp
 BDy52f6Y7RZc61uLD6uQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jj3y4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 18:41:13 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-40b0096024eso160575b6e.0
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 11:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751481673; x=1752086473;
 h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HDOAgqdvnMBZZpEZh4yzmK9zvBDjP1rjpUfSRdH7hCw=;
 b=tnOXfhJleuoDO8UtQqb2To4hT60TKYBtI8ptFkfCZVyUjMxhe6vKfgOJ2Vqm5UTfQo
 w2Tu6qcbaX5icqRrY6uWvMLOUjXbhPb/XnmHaozcoMmwZPwvDl6W3bQs9sFvdk9GLHsC
 mMEEpw0by8XnNleTmhUxKUHFIKBS48lYbEjZvFivgebhCToyyra6NWUjbKBOOmsFjpdu
 yu5HjRxWpUWenx/zv1l6UI+xUNSeeWiE4kqzJUpIxq08YdNGj478zZbXbKKHZLGVeKB2
 ao7bjJ+7vtHoRBoB/eOpiRnatDyXJTST1xFqpxuQgnEXm+F23uNsJcqQcWgQn9wKrIAh
 FyYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtTBiWSUUzSAVeZGPqt28UxPQzi7iQB/zrcZNigKyR8lYQcT+v4t1D5qxCep/UI3Jd2ZbOc12w@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzzu7w6+vURqqAGXRoc+6yCi83oGJWrjbfEQAPvl55n8nmx4QMf
 hs35Yi1HexOh7pqYrDlFCUZHKjIaCjOGlyg8ThlyidAORfgAB8rDyZYrhfQECjCd4N0PXHaD2ML
 qi+uiGXNrN0iRjXsc1RiPB3cEeTQWI1F7gxA1xwuq3NCTLcBCXQC8szrj68M5ltIqWGvMZmOgkH
 57esNvedK+1GWEn+A4Yccg5gStt8hawmY2Tv40shNMOS8=
X-Gm-Gg: ASbGncuqKXGbOR+3ocx0/ByUk0/l+tps2oBejNJrzPmVpGnqdrwOaLsvMEihEOPMl9k
 g2I9vGIsd08uurppD8x3+YGRsvKLgacLNv6tqf+uC+KxykMhS2xhEjekHcP3uhfxNa4VLldMdq3
 Y4buyL6g013os6qwKXd8BKqB7LCVeApf01iTE=
X-Received: by 2002:a05:6808:5146:b0:406:6aa1:38d9 with SMTP id
 5614622812f47-40bc11913d5mr498575b6e.13.1751481672636; 
 Wed, 02 Jul 2025 11:41:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlQmHndI9ppZAkhlooSCHd6/vHTuT4bsJ5tFqoHMFjH4qiFMNEAvbg/35Tivhp6LtwlsmiRU8zgSWS0FXzp18=
X-Received: by 2002:a05:6808:5146:b0:406:6aa1:38d9 with SMTP id
 5614622812f47-40bc11913d5mr498561b6e.13.1751481672246; Wed, 02 Jul 2025
 11:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-7-robin.clark@oss.qualcomm.com>
 <20250701162014.u6lhg7g6gcjebofo@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250701162014.u6lhg7g6gcjebofo@kamilkon-DESK.igk.intel.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 11:41:01 -0700
X-Gm-Features: Ac12FXz7ZSTjXlr-9Iv0mwO5N0J8lBKAiAEyyHrIkfpWv5RxykutX8ORDHT9hNI
Message-ID: <CACSVV014fDckkZksEf-T+n54xQoBpSk4Weg-0Wq3ppEiYryARw@mail.gmail.com>
Subject: Re: [PATCH igt 6/9] msm/mapping: Wait for devcore to become available
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <rob.clark@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=68657d49 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=6aLHVZsPNDPI464lO-QA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: gqr_9aOHvq29Ndxsk07C1LRvUqc5vQ0I
X-Proofpoint-GUID: gqr_9aOHvq29Ndxsk07C1LRvUqc5vQ0I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NSBTYWx0ZWRfXwRY4McXuf7VR
 ktW0wmSx7yvQbezKqCqgmSkKwdVusPuvM3Ly5zGWawi15A+eldRD/7uOBQcesyhZ63m/cdowaxK
 T/Q4Qbn4odosY2Tpn14TQpNQPZi3ObTvYODl6kICVfSXH2cCtIbK80Y++mPhmStHlFNahkiUGyZ
 5Vwt49+q54KiVktTlXzyy03/MaTZRYyifZdMzXOVI/oejSfJiE+MttqNqzN4rnnJC5NOB7CFzUy
 RXhfk/te+pcg01bOVkCcs2tIC0SJIZ3vu11/C17KB/UPAfVocLEXzgOpZi3GcZFTR6pK2t2Va/R
 CUzvQxQRNc8+cM7QurOSD4GE/+g6gE47xrzmzopyqUBcRVqj+b3YLCgdyICkiknq385r9bl2Eh/
 qdyQS5DN7EDN6i2iJKkdM+KBwij+qvsU3BeuKnczEjL9rR9OXO5L96gG6vj5CAplSdTXT4IR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020155
X-Mailman-Approved-At: Fri, 04 Jul 2025 13:30:46 +0000
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

On Tue, Jul 1, 2025 at 9:20=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Rob,
> On 2025-06-30 at 11:09:00 -0700, Rob Clark wrote:
> > From: Rob Clark <rob.clark@oss.qualcomm.com>
>
> Is this the same as 1/9 patch?

No, but similar.  Both tests have a similar, but subtly different,
function to read the devcore.  (In the mapping test, we don't have to
read the whole file, but we want to return the first part so the test
can parse it.. in the recovery test we don't need to parse it, but
want to explicitly read the entire devcore.)

BR,
-R

>
> One more nit just spotted, it is useally 'i-g-t' after PATCH:
>
> [PATCH i-g-t 6/9] tests/msm/msm_mapping: Wait for devcore to become avail=
able
>
> Regards,
> Kamil
>
> >
> > The devcore could take some time to show up, so add a igt_wait() with
> > timeout so we don't fail the test if the devcore is not immediately
> > available.
> >
> > This addresses a source of flakeyness.
> >
> > Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> > ---
> >  tests/msm/msm_mapping.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> > index 846385bb5206..03a9e814c931 100644
> > --- a/tests/msm/msm_mapping.c
> > +++ b/tests/msm/msm_mapping.c
> > @@ -42,14 +42,18 @@
> >   */
> >
> >  static char *
> > -get_and_clear_devcore(void)
> > +get_and_clear_devcore(int timeout_ms)
> >  {
> >       glob_t glob_buf =3D {0};
> >       char *buf =3D NULL;
> > -     int ret, fd;
> > +     int fd;
> >
> > -     ret =3D glob("/sys/class/devcoredump/devcd*/data", GLOB_NOSORT, N=
ULL, &glob_buf);
> > -     if ((ret =3D=3D GLOB_NOMATCH) || !glob_buf.gl_pathc)
> > +     /* The devcore shows up asynchronously, so it might not be
> > +      * immediately available:
> > +      */
> > +     if (!igt_wait(glob("/sys/class/devcoredump/devcd*/data",
> > +                        GLOB_NOSORT, NULL, &glob_buf) !=3D GLOB_NOMATC=
H,
> > +                   timeout_ms, 100))
> >               return NULL;
> >
> >       fd =3D open(glob_buf.gl_pathv[0], O_RDWR);
> > @@ -175,7 +179,7 @@ do_mapping_test(struct msm_pipe *pipe, const char *=
buffername, bool write)
> >       int fence_fd, ret;
> >
> >       /* Clear any existing devcore's: */
> > -     while ((devcore =3D get_and_clear_devcore())) {
> > +     while ((devcore =3D get_and_clear_devcore(0))) {
> >               free(devcore);
> >       }
> >
> > @@ -208,7 +212,7 @@ do_mapping_test(struct msm_pipe *pipe, const char *=
buffername, bool write)
> >       /* And now we should have gotten a devcore from the iova fault
> >        * triggered by the read or write:
> >        */
> > -     devcore =3D get_and_clear_devcore();
> > +     devcore =3D get_and_clear_devcore(1000);
> >       igt_fail_on(!devcore);
> >
> >       /* Make sure the devcore is from iova fault: */
> > --
> > 2.50.0
> >
