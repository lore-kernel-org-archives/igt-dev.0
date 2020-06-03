Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBD76E0AF
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2020 06:42:08 +0000 (UTC)
Received: from platvala by thrakatuluk with local (Exim 4.92)
 (envelope-from <petri.latvala@intel.com>) id 1jgN6D-0002og-7x
 for igt-dev@lists.freedesktop.org; Wed, 03 Jun 2020 09:42:05 +0300
Date: Wed, 3 Jun 2020 09:42:05 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200603064205.GM9497@platvala-desk.ger.corp.intel.com>
References: <20200602101916.30459-1-petri.latvala@intel.com>
 <159112006059.21428.6170583637569231342@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159112006059.21428.6170583637569231342@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Adapt_to_device-based_DRM_logging_changes?=
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
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 02, 2020 at 05:47:40PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Adapt to device-based DRM logging changes
> URL   : https://patchwork.freedesktop.org/series/77912/
> State : success

That was less impactful than I thought. Cibuglog filters weren't too
strict so already caught everything, with one new bug filed for this
change (drm/intel#1982, "Atomic update on pipe x took n us, max time
under evasion is n us").

Merged, thanks for the review!


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
