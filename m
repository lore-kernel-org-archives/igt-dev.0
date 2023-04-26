Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823CC10E25E
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 08:45:02 +0000 (UTC)
Date: Wed, 26 Apr 2023 10:44:42 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230426104442.6fa26e13@maurocar-mobl2>
In-Reply-To: <20230424080233.2016931-1-bhanuprakash.modem@intel.com>
References: <20230424080233.2016931-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] tests: New dir structure for intel specific
 tests
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

On Mon, 24 Apr 2023 13:32:33 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> As we have many KMS tests those can support both i915 & XE, we
> can have new dir structure to place tests in a proper location.
> 
> Below is the new dir structure:
> - tests/intel/i915/ : All i915 specific tests should move here.
> - tests/intel/xe/   : All XE specific tests should move here.
> - tests/intel/      : Tests those supports both i915 & XE should
>                       move here. Example: kms_psr

Hmm... having xe and i915 common tests under tests/intel makes sense
to me.

Yet, IMO, if we're doing a change like that, IMO we also need to:

- do a similar change for lib/ - which also has some parts that
  are common to both drivers and some that are driver-specific;

- double-check the IGT test namespace for it to properly reflect
  the Intel common testset;

- Maybe split the test lists into 3 separate sets.

Regards,
Mauro
