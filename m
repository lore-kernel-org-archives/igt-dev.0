Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2C510E028
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 13:20:50 +0000 (UTC)
Date: Wed, 6 Dec 2023 14:20:45 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231206132045.zueuquideqpvzxxt@kamilkon-desk.igk.intel.com>
References: <20231206105206.115463-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231206105206.115463-1-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/1] Add some missing descriptions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,
On 2023-12-06 at 11:51:29 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Address those build time warnings:
> 
> 	Warning: igt@xe_live_ktest@bo Description documentation is missing
> 	Warning: igt@xe_live_ktest@dmabuf Description documentation is missing
> 	Warning: igt@xe_live_ktest@migrate Description documentation is missing
> 	Warning: igt@xe_media_fill@media-fill Description documentation is missing

You actually adressed only this one, do you plan send other fixes?

Regards,
Kamil

> 	Warning: igt@xe_sysfs_defaults@engine-defaults Description documentation is missing
> 
> Mauro Carvalho Chehab (1):
>   intel/xe_media_fill.c: address a documentation warning
> 
>  tests/intel/xe_media_fill.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> -- 
> 2.43.0
> 

