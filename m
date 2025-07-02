Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D3DC83F0C
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 13:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606DF10EA50;
	Fri,  4 Jul 2025 13:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gz/Pxbg8";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E39510E764
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 19:00:45 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562EQ4hU000324
 for <igt-dev@lists.freedesktop.org>; Wed, 2 Jul 2025 19:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=+Hi4OFWQN74gf29SCjhq82t1+AZHZTzvICMf6bwxODM=; b=Gz
 /Pxbg8eKHb4SIWYa3Jpwtgl7ikIocw06njIAMyI42GsMJOQnEn5oIaGxvzq05oQZ
 dVe1jWW4gBmrjL46GwVZH1vLbyx9ZFs9RH+AEFv+73sXbU74mhY4ca7Pbyc36Xq8
 GG7QXJwplPhdzNCxvgK2TMcG/YJRzi8msy6/893JULPtwAdpRDvpG9KBH7ciDznK
 rm5IqeteztpSddQQEN8ZzqTb6/JFc8ApsFphpLlntO34oFXJ/k1QCXHOX435Hcss
 D1PNr2nv5DNf/oaAicOQOtRGKElEhB+lRt7FtL9pqwM137GKc2eY1RHbhCV4+XTQ
 3qFr7shggYccs0gDoS4Q==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmdn9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 19:00:43 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-4066941a3e5so6402069b6e.2
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 12:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751482843; x=1752087643;
 h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Hi4OFWQN74gf29SCjhq82t1+AZHZTzvICMf6bwxODM=;
 b=QVVMWJ2m87KE44iuYVm06vd2RD7m3M5MZM6OFD67xNPgvhrDepbZwjVha9y7j1KtlB
 VgkQ2ZykH7Rip+WJrK6WZWI+es+Q07WHZK6N3kpEv9yLeIEXD6T4UnBmzyneKuAFvgO4
 QTxlH3zpxIqbZjJwMjfUAU8KBCjMn/lWGvlahCLGkpm2USxbJev622478L/qCtK/vGqw
 MFilqw7iTkxxNqsqf7ytCKcc4uuFXyMmHDxQHBNhuG/UNyeTdstgV7F4BOPosT+a9lzH
 LNa0/5erecqRmN+gOTfbqrdhC7vVCuFjNOjASO2FiJDsjFZ7SZ5SGv/Ssi+tzqOym8gC
 ZuLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfzTIGZJvcV1b+364vECJol/NKfgISXGDSaC2IJp/RZGkUCqKxUZXX+xWPaKweSp7IzmXdrMiR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyN8e9QvgymqQMgW/3ZK015ljCgEuYSJYkHuCeo01p6OG9dh14s
 6UqY6ufDA2kOg8OLYrJ29vZnviEGP0CDz7pYzDhSOJ/ht1LrD7QHH66bIcqfM/JkcjnqsmPD2AP
 tuSgdhlit1yupS9jQVHcXBiY7CIrYua7WzK9gGTDt4n3L3deqWku7t6PbXhXJ6RXc6D7RPfzPzH
 zHhc9KqiBccNLz7mnkvUzVSThVE6gPmFuCFAGo015yNq4=
X-Gm-Gg: ASbGncuIX6LSjUEh+NWcklvsTqgqs/rC6WvJhFKsmIFjkUuzpjSpik+nJy0iJ3qip6C
 vWjNCdBvkN4CuEHDs2cZcLPHecyh8kpAbkGxSfOkR8R9Qm+rU5AESH4jU8/vYCK8Tqxr9HcEmt4
 SHgJFKqkEI55VwV+cR1mdAgNR0eGsEAdxenm4=
X-Received: by 2002:a05:6808:6d8e:b0:404:8e:69c2 with SMTP id
 5614622812f47-40bfdf21e90mr295869b6e.0.1751482842893; 
 Wed, 02 Jul 2025 12:00:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRMcrRIZay6hMAGvVa57iatWkhPq9rIs+Lvfh48yNUeZ9KCbXf+fEf3iNU68YsrjhIhBQGRsdLElq5+I5VUjs=
X-Received: by 2002:a05:6808:6d8e:b0:404:8e:69c2 with SMTP id
 5614622812f47-40bfdf21e90mr295848b6e.0.1751482842545; Wed, 02 Jul 2025
 12:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-8-robin.clark@oss.qualcomm.com>
 <20250701162114.5gkdr7f5cww23ou4@kamilkon-DESK.igk.intel.com>
 <CACSVV02jA9dFUFuaKAmoOn_wav0V-QrTj4vo6Krr2V4n7MRDKQ@mail.gmail.com>
 <20250702074835.7pcbjlhczplibowt@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250702074835.7pcbjlhczplibowt@kamilkon-DESK.igk.intel.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 12:00:29 -0700
X-Gm-Features: Ac12FXz-65Bv82tj3yj2dd8MCkuAfc2blW-3OHfQEJHly2NJrDaG4_vgnVPpqaA
Message-ID: <CACSVV00fGkeGKXviFHVR6Qrz+pXLgVSpqr3-4GqBT2TH_nxxgA@mail.gmail.com>
Subject: Re: [PATCH igt 7/9] msm/mapping: Handle larger gmem file size
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=686581db cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=FV7_indNlyCjRKMUmb8A:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: YnK2zdzU-t-krODt-to48QZpVoEDp4Th
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfXy9V25ITo6TdJ
 Pg5davWvVbFqQFdyNE0JrrEyTudMnHrXTVHuzfyhR4hJjAgZQ0w3XrIZG3n/wHC48CZhbXmVtDT
 Dd3Hxa7xEPqGTlRq2mktm4+4r41eGqV7IzffQKqtOITAd1b3RquVMDHHDcAArGGxIQYI1XAiW8u
 UIxueMOBjKY5xMPc/X+xCu3DFJlbJcXBRSoN7ks/mgUzMgiYHtJVqJSoQ0WwIzmHOXrBdI/0CaE
 zqVlaSncWomjp/zvmoL7p0nM9JW9+aw+vXKlcPuTACqAIWFWRLUlrc1DkRATW3CKYQbmqX3ufDF
 6GjgVSwKEEKNRvbDVmILSu7XW2s74dEMEDmOPdrX54g1ckwa8dFukg2kbK/FmRHlIuxcAJqdgXp
 KrGvK3bJbvvvyHXTtkQLsTfrdwp7Lo4lV02nnXVzhcwM5ImvGtgKQylSgcTlbA9C1YzwAMy/
X-Proofpoint-GUID: YnK2zdzU-t-krODt-to48QZpVoEDp4Th
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020156
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

On Wed, Jul 2, 2025 at 12:48=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Rob,
> On 2025-07-01 at 11:01:06 -0700, Rob Clark wrote:
> > On Tue, Jul 1, 2025 at 9:21=E2=80=AFAM Kamil Konieczny
> > <kamil.konieczny@linux.intel.com> wrote:
> > >
> > > Hi Rob,
> > > On 2025-06-30 at 11:09:01 -0700, Rob Clark wrote:
> > > > From: Rob Clark <rob.clark@oss.qualcomm.com>
> > > >
> > > > If running on a system with full desktop environment, the file will=
 be
> > > > much larger than 0x4000 bytes.
> > > >
> > > > Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> > > > ---
> > > >  tests/msm/msm_mapping.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> > > > index 03a9e814c931..978ea18375dd 100644
> > > > --- a/tests/msm/msm_mapping.c
> > > > +++ b/tests/msm/msm_mapping.c
> > > > @@ -122,7 +122,7 @@ endswith(const char *str, const char *end)
> > > >  static uint64_t
> > > >  get_bo_addr(int drm_fd, const char *name)
> > > >  {
> > > > -     char buf[0x4000];
> > > > +     char buf[0x80000];
> > >
> > > If it is that big why not malloc() it?
> >
> > in kernel, for sure.  But userspace stack size is multiple MB at least
> >
> > BR,
> > -R
>
> You are reading "gem" debugfs below, so this buffer in igt is in
> userspace, no need for it to be on stack. Btw you just discovered
> a bug in igt, imho this function should give sizeof(buf) to caller
> here to igt_debugfs_read():
>
> igt_debugfs_read(drm_fd, "gem", buf, sizeof(buf));

Actually igt_debugfs_read() is a convenience wrapper macro for
__igt_debugfs_read() which does just this.  But makes
igt_debugfs_read() more convenient for stack allocated buffers.

BR,
-R

>
> Also imho it should be calloc() to avoid garbage later on in buf.
> Or if it should read all of debugfs node, make it like:
>
> int igt_debugfs_read_all(int drm_fd, char *, char **buf);
>
> and let it alloc *buf, and later realloc this *buf if needed.
>
> Regards,
> Kamil
>
> >
> > > Regards,
> > > Kamil
> > >
> > > >       char *p =3D buf;
> > > >
> > > >       igt_debugfs_read(drm_fd, "gem", buf);
> > > > --
> > > > 2.50.0
> > > >
