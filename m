Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D196E9CC
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2020 13:09:20 +0000 (UTC)
Date: Wed, 15 Jan 2020 15:09:15 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200115130915.afkcbio4qu3muoxl@ahiler-desk1.fi.intel.com>
References: <20200114091745.4555-1-petri.latvala@intel.com>
 <20200114091745.4555-4-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114091745.4555-4-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] runner_tests: Test that dynamic
 subtest failure is handled correctly
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jan 14, 2020 at 11:17:45AM +0200, Petri Latvala wrote:
> See also: commit 0e6457f1bfe2 ("lib: Don't dump log buffer when
> dynamic subtest failure is inherited")
> 
> This is quite an explicit top-to-bottom test that we don't get an
> incorrect warn result for an innocent dynamic subtest. It is tested
> here in runner_test instead of testing in lib/tests that the extra
> lines are not printed, because not printing the extra lines is an
> implementation detail that might change later. The issue is after all
> about test results parsed by igt_runner.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

The whole series is

Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

although I would squash patch 3 and 4 together
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
