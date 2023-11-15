Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8CC10E02B
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 16:54:48 +0000 (UTC)
Date: Wed, 15 Nov 2023 17:54:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Message-ID: <20231115165443.t3ozq3qgatx4a5yo@kamilkon-desk.igk.intel.com>
References: <20231110025327.7395-1-Lang.Yu@amd.com>
 <ef39d175-776b-4a5b-8a3c-0ae06d2a967a@amd.com>
 <MW6PR12MB8898CAAEDD706A6737F8C41DFBB3A@MW6PR12MB8898.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MW6PR12MB8898CAAEDD706A6737F8C41DFBB3A@MW6PR12MB8898.namprd12.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH v2] tests/amdgpu: add VPE tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Yu,
 Lang" <Lang.Yu@amd.com>, "Liu, Leo" <Leo.Liu@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Yu,
On 2023-11-13 at 02:47:55 +0000, Yu, Lang wrote:
> [AMD Official Use Only - General]
> 
> >-----Original Message-----
> >From: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
> >Sent: Monday, November 13, 2023 6:37 AM
> >To: Yu, Lang <Lang.Yu@amd.com>; igt-dev@lists.freedesktop.org
> >Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Deucher, Alexander
> ><Alexander.Deucher@amd.com>; Prosyak, Vitaly <Vitaly.Prosyak@amd.com>;
> >Chiu, Solomon <Solomon.Chiu@amd.com>; Liu, Leo <Leo.Liu@amd.com>
> >Subject: Re: [PATCH v2] tests/amdgpu: add VPE tests
> >
> >Added Leo.
> >
> >Hi Lang,
> >
> >Please, use the checkpatch.pl and fix formatting errors, for example,
> 
> Actually, it is strange to use checkpatch.pl to check igt patches.
> How do you know the igt test developer is familiar with linux kernel tools?
> Anyway I will check the patch  with checkpatch.pl.
> 

It is a tool which helps with keeping source code in shape, instead of
reinventing our own tool it is better to use it. Some of its errors or
warnings may be ignored but generally I find it usefull.

Regards,
Kamil

> >
> >vprosyak@desktop-host:~/src/igt-gpu-tools$ ../linux/scripts/checkpatch.pl -f --no-
> >tree /home/vprosyak/src/igt-gpu-tools/tests/amdgpu/amd_vpe.c
> >ERROR: code indent should use tabs where possible
> >#54: FILE: /home/vprosyak/src/igt-gpu-tools/tests/amdgpu/amd_vpe.c:54:
> >+                                 struct mmd_context *context)$
> >
> >WARNING: please, no spaces at the start of a line
> >#54: FILE: /home/vprosyak/src/igt-gpu-tools/tests/amdgpu/amd_vpe.c:54:
> >+                                 struct mmd_context *context)$
> >
[...]
