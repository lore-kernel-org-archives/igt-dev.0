Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CC310E1C6
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 08:49:10 +0000 (UTC)
Date: Thu, 17 Aug 2023 10:49:06 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230817104906.6fe0feea@maurocar-mobl2>
In-Reply-To: <20230817054916.525796-1-bhanuprakash.modem@intel.com>
References: <20230817054916.525796-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] meson_options: Disable testplan by default
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 17 Aug 2023 11:19:16 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> Disable testplan until we fully enabled it.

Not sure why you want to do that.

Disabling it is bad, as it will prevent the system to generate warnings
and errors with broken documentation patches, which ends breaking
several Intel CI reports that depend on them.

If your concern is with regards to documentation, besides the documentation
already inside igt_doc.py, I just sent a patch documenting how testplan docs
work and explaining that the check for i915, KMS and Xe documentation
happens at build time:

	https://patchwork.freedesktop.org/series/122564/

So, please don't merge this change.

Regards,
Mauro
