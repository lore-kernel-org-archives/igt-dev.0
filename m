Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0010088E2B
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2020 10:42:18 +0000 (UTC)
Date: Tue, 25 Feb 2020 12:42:15 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200225104215.GE3839@platvala-desk.ger.corp.intel.com>
References: <20200218070930.18246-1-satyavathi.k@intel.com>
 <158204624858.31432.4716364936280480034@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158204624858.31432.4716364936280480034@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fringfill=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fengin?=
 =?utf-8?q?e_to_utilize_all_available_engines=2E_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: satyavat <satyavathi.k@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Feb 18, 2020 at 05:17:28PM +0000, Patchwork wrote:
> == Testlist changes ==
> 
> +igt@gem_ringfill@basic-
> +igt@gem_ringfill@basic-fd
> +igt@gem_ringfill@basic-forked
> +igt@gem_ringfill@basic-hang
> +igt@gem_ringfill@basic-interruptible
> +igt@gem_ringfill@bomb
> +igt@gem_ringfill@child
> +igt@gem_ringfill@s3
> +igt@gem_ringfill@s4


A bit more work needs to be put into the loop to avoid the "basic-"
subtest name when suffix is empty and m->basic is true. That subtest
needs to be just "basic".


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
