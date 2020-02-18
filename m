Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85566E9FF
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 13:35:23 +0000 (UTC)
Date: Tue, 18 Feb 2020 14:35:21 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20200218133521.GD16640@kdec5-desk.ger.corp.intel.com>
References: <20200218125333.29250-1-katarzyna.dec@intel.com>
 <158203061046.3043.4715913528366392727@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158203061046.3043.4715913528366392727@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Check if device is not wedged
 while opening fd
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Feb 18, 2020 at 12:56:50PM +0000, Chris Wilson wrote:
> Quoting Katarzyna Dec (2020-02-18 12:53:33)
> > In rare cases it is possible to use wedged device in testing,
> > what is causing to have false results. Let's abort any fd usage when
> > GPU is wedged. Use sysfs to check status to make any environment happy.
> 
> See igt_require_gem()
> -Chris

You're right! Thanks :)
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
