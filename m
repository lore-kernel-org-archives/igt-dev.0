Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967A289D60
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2020 09:07:55 +0000 (UTC)
Date: Mon, 30 Mar 2020 12:07:52 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200330090752.GC9497@platvala-desk.ger.corp.intel.com>
References: <20200330081707.3084-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330081707.3084-1-mika.kahola@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_concurrent: Move bandwidth
 calculation to igt_fixture
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 11:17:07AM +0300, Mika Kahola wrote:
> The commit 153b34b5353df8c18a87d ("tests/kms_concurrent:
> Test maximum number of planes supported by the platform")
> caused regression on HSW pipe B testing such as.
> 
> IGT-Version: 1.25-gfd8248084 (x86_64) (Linux: 5.6.0-rc7-CI-CI_DRM_8194+ x86_64)
> Starting subtest: pipe-B
> Testing resolution with connector VGA-1 using pipe B with seed 1585245074
> child 0 died with signal 11, Segmentation fault
> Subtest pipe-B: FAIL (0.330s)

What was the crash reason? Why does doing this in fixture help?


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
