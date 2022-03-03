Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F5710E1CA
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Mar 2022 06:09:39 +0000 (UTC)
Date: Thu, 3 Mar 2022 07:09:36 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YiBboHmOS4cuU1iH@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [igt-dev] [RFC] Use HAX for series which add igt_describe
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

Hi all.

Last time we got number of patches which don't change test logic so
they trigger BAT + IGT runs.

This is imo a waste of time for CI as it doesn't improve anything apart
of better in-test documentation.

As such patches needs to be reviewed I think we could use HAX patch in
which we remove all subtests in tests/intel-ci/fast-feedback.testlist
adding line with:

igt@meta_test@fail-result

Any comments are welcome.
--
Zbigniew
