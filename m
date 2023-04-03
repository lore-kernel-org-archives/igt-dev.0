Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4EF897C8
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 10:56:29 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.28.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C5E5D5804D9
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 03:56:27 -0700 (PDT)
Received: from localhost ([127.0.0.1])
 by linux.intel.com with esmtp (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pjHrN-000akj-0p
 for igt-dev@lists.freedesktop.org; Mon, 03 Apr 2023 12:56:25 +0200
Message-ID: <b1e68d16-3a3a-6142-8eb9-5835e9f81824@linux.intel.com>
Date: Mon, 3 Apr 2023 12:56:25 +0200
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
References: <20230403103359.165928-1-zbigniew.kempczynski@intel.com>
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
In-Reply-To: <20230403103359.165928-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Add missing change in xe_create
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 4/3/23 12:33, Zbigniew Kempczyński wrote:
> During the review I merged this in another branch so it wasn't pushed
> properly to master branch.
>
> Also add this subtest to BAT run. Expect the failure on vram as this
> is not addressed in the kernel yet.
>
> Zbigniew Kempczyński (2):
>    xe/xe_create: Use system configuration page size
>    intel-ci/xe-fast-feedback: Add xe_create@create-invalid-size subtest
>      to BAT
>
>   tests/intel-ci/xe-fast-feedback.testlist | 1 +
>   tests/xe/xe_create.c                     | 5 +++--
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
Didn't test patch 2, but, assuming it passes on all platforms:


Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
