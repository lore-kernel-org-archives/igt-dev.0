Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D116E277
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 12:57:06 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200218125333.29250-1-katarzyna.dec@intel.com>
References: <20200218125333.29250-1-katarzyna.dec@intel.com>
Message-ID: <158203061046.3043.4715913528366392727@skylake-alporthouse-com>
Date: Tue, 18 Feb 2020 12:56:50 +0000
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
To: Katarzyna Dec <katarzyna.dec@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Katarzyna Dec (2020-02-18 12:53:33)
> In rare cases it is possible to use wedged device in testing,
> what is causing to have false results. Let's abort any fd usage when
> GPU is wedged. Use sysfs to check status to make any environment happy.

See igt_require_gem()
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
