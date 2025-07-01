Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B36C83013
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 12:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DA810E6FC;
	Wed,  2 Jul 2025 12:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AI6jlCvY";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0CF10E5F3
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 18:02:21 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561HahXk028661
 for <igt-dev@lists.freedesktop.org>; Tue, 1 Jul 2025 18:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=CQ+/zsTAqe6KKzt7JNCR9p0ICYFm+DFlKaKEBaEu+A4=; b=AI
 6jlCvYlE+IeehXlbRWz1Yx4zT+SWuAf1UthgpXjnj9yMX7rZWanKAPmhm+kOIADF
 ZMzp2HZawuaM9y5uoj2uVNe/hZHK0KS3IsndPwKHB+E9YLE/007JV/9gXfkiGPQ6
 50cmxEml5nkG28gcXacFmjo4iyAWaTR3QOteooByb+5+nWGTB6fGUzuN6x6UAusV
 Xj/zlLEbUjrzN8kcPfcYbO943vhjQuBsZle0Ow3WGGiEqUJsjZklNCE/H5KBSsjO
 m/qKTFq0WEJuQw3JBnAhl3h4ubg22meTge89aNtHLs+kFG7I+zie3y/KMcLiXvuy
 7KBtBXrE21IX23l/WOSg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvsu1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Tue, 01 Jul 2025 18:02:20 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-611e20dd308so268945eaf.2
 for <igt-dev@lists.freedesktop.org>; Tue, 01 Jul 2025 11:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751392939; x=1751997739;
 h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CQ+/zsTAqe6KKzt7JNCR9p0ICYFm+DFlKaKEBaEu+A4=;
 b=lJtVo1ozFQlrF6f+PE6+FJnByLxVi58j6i69KtjH6Qy20ACzmr+9vTi/9tvKyc19M2
 CZNxCnH4Rq9tJNUcf4uK2KNRYQb7DxmkZdFaEL+yIBly1+rGiykwzI6RpJMC1IPHyw2u
 YyOrA7+YwBQAYlIm1ZkhKaJsrwWeXL4LAYERcEfLE/noCrh6ZfMDrsPslGFFb1x/hspE
 RC//Y8Rf2qvZakN3JjjlacP+z0F0C7MplH26xd7GksJSUFhDc8H7TCRRAZspL4QGRjsd
 Bfgiak1hbMvYQ42HHrYN43i8DHt+x90L14UM0DrOcQnvouarjUBGhHcyA42fqJkI2Cn6
 sw9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGiAJc/JyhnBQ9JLEkz9E0hZCUYnKnmma9kw1tbUAh/3AcQznrybRX1QZp6byCz6NGNDmfOoGZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzuz3fAxVcCkEhmC79V1JJOxHEab+746VH9fOMlKq0AjWhwQioa
 l8GvFF/Z1Ln3HidOVSduiA9MShq5i9AJs1tfHm2uXd3Opy8kmEtjIWBBMHmBWuitTBTfFIZCf0I
 rsKmnogh37Euad4IyU8WbnMwHR3UuL8x4EjX+14jgYZ5T11Vgx7a7hFgQrmrKVTOwr5MWgoYKIp
 XVlTQX32ksl9LU62+jJB5/lWsy9EZagnGfKxSzm9k0zCg=
X-Gm-Gg: ASbGncs2L20YeqtUp2DD2BhDmYiNdJ1WFbpiTHBj7p6gR86CCgJKQhI06IzDehOYC5l
 I0YbFp6Gwy2IqqmPg4rjRq6tVXeQqmWzDt5DS1ja760Wx9H3Ds2hCvxGihwVB78bLFa81xOZgek
 ygzc12rLT7olKlPeep40y9KVPe3POp95wjqyU=
X-Received: by 2002:a05:6820:2089:b0:611:e30a:f9c7 with SMTP id
 006d021491bc7-611e30afbaamr6002767eaf.7.1751392939212; 
 Tue, 01 Jul 2025 11:02:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGLLMPx8gOzV/UHxJmHmm+YJfG0GmnfPmwSBIgSo8SZCDasmY6x5pEdz1Xvh7rP/DSNZL6VK6+oNWw7imEboM=
X-Received: by 2002:a05:6820:2089:b0:611:e30a:f9c7 with SMTP id
 006d021491bc7-611e30afbaamr6002704eaf.7.1751392938612; Tue, 01 Jul 2025
 11:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-9-robin.clark@oss.qualcomm.com>
 <20250701162420.7dndnmld2p73atex@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250701162420.7dndnmld2p73atex@kamilkon-DESK.igk.intel.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 11:02:07 -0700
X-Gm-Features: Ac12FXyivs6UOMVJtoIllSHU4SZK8oXweiKud8YnoU_KM87ZfFJLhnfpNoVTO3E
Message-ID: <CACSVV0251in35dD-=hk9oy6USZCxHR-oWFy+Xk+YsSyy_LDYtQ@mail.gmail.com>
Subject: Re: [PATCH igt 8/9] msm/mapping: Add wait for stall-on-fault to re-arm
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <rob.clark@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: k2dtZ52LMaW4kpKMTZQXBPKt_rRNdqLe
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=686422ac cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=3PguM2h0FNWI6asSIAsA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: k2dtZ52LMaW4kpKMTZQXBPKt_rRNdqLe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEyNCBTYWx0ZWRfX/UHyOVYGEk8z
 Nb38rBqvnNkMfjHfoBabh9qI2XCCHsu11QV/zZ84k1mlJFx1pnAe4KDOs7q+xn4oJE6siWGxN/q
 9PW78lJlG5IKJxn4mXmIKPlDM6NpTHLt9Vp9ZICFxZt/6O7MU2z2Dk92PqPQ1cDwzq4WiDx+fqM
 TqlI0m4tDsyDpbp2FpX/y8C1JL/qeNmsmCca1SGy15lu0iwvKxaFI+X9a/Ww5BADGUOIawFYP8c
 Q1sqL5TivD+VB9LBXT2ML3Av+N5cI6ts4w/h5TH6Mcc20eO2BLrYXZbbS+RKKdOfnkRDFj3vzx6
 FU3mZs8OSLxDvL55vEL0stRsZ1Kcj3uK9MvR/cndT15niXqWaxF05s7t4sj8W69QkT6T3esN1P9
 CVKiJHUDM9x04SRhtUOhzkvQAdA2bSlYqspTHkeIrrE6NjWwS6aU6pDh777IgY4GcPl0L/qJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010124
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

On Tue, Jul 1, 2025 at 9:24=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Rob,
> On 2025-06-30 at 11:09:02 -0700, Rob Clark wrote:
> > From: Rob Clark <rob.clark@oss.qualcomm.com>
> >
> > Newer kernels disable stall-on-fault for a grace period, to avoid a
> > flood of faults causing instability with memory translations that
> > the hw attempts with the translation stalled.  Fortunately it adds a
>
> Is it system-wide or only for msm driver?

specific to msm

BR,
-R

> Please improve subject:
>
> [PATCH igt 8/9] tests/msm/msm_mapping: Add wait for stall-on-fault to re-=
arm
>
> imho it could be shorter:
>
> [PATCH igt 8/9] tests/msm/msm_mapping: Wait for stall-on-fault
>
> Regards,
> Kamil
>
> > debugfs file so we can know how long we need to wait for stall-on-
> > fault to be re-enabled.
> >
> > Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> > ---
> >  tests/msm/msm_mapping.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> > index 978ea18375dd..7e2f5c7eadc8 100644
> > --- a/tests/msm/msm_mapping.c
> > +++ b/tests/msm/msm_mapping.c
> > @@ -74,6 +74,30 @@ get_and_clear_devcore(int timeout_ms)
> >       return buf;
> >  }
> >
> > +static void
> > +wait_for_stall_on_fault(int drm_fd)
> > +{
> > +     char buf[64] =3D "\0";
> > +
> > +     do {
> > +             int us;
> > +
> > +             igt_debugfs_read(drm_fd, "stall_reenable_time_us", buf);
> > +             if (!strlen(buf)) {
> > +                     /* Not supported on older kernels: */
> > +                     return;
> > +             }
> > +
> > +             us =3D atoi(buf);
> > +             if (!us) {
> > +                     /* Done waiting: */
> > +                     return;
> > +             }
> > +
> > +             usleep(us);
> > +     } while (true);
> > +}
> > +
> >  /*
> >   * Helper to find named buffer address
> >   */
> > @@ -224,6 +248,11 @@ do_mapping_test(struct msm_pipe *pipe, const char =
*buffername, bool write)
> >       ret =3D sscanf(s, "  - iova=3D%"PRIx64, &fault_addr);
> >       igt_fail_on(ret !=3D 1);
> >       igt_fail_on(addr !=3D fault_addr);
> > +
> > +     /* Wait for stall-on-fault to re-enable, otherwise the next sub-t=
est
> > +      * would not generate a devcore:
> > +      */
> > +     wait_for_stall_on_fault(pipe->dev->fd);
> >  }
> >
> >  /*
> > --
> > 2.50.0
> >
