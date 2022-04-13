Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC4210FB5C
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Apr 2022 10:28:13 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 13 Apr 2022 15:56:06 +0530
Message-Id: <20220413102608.1795110-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] Add support to handle displays having 5k+
 modes
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

As single crtc can handle max of 5k resolution, and we need one
more crtc to handle > 5k modes.

This patch will skip the scenarios where those crtc/mode combinations
won't fit.

Example:
Consider two 8K panels connected via DP-1 & DP-2 resp, and we have four
pipes (A-D) got enabled. So, below are the combos for basic subtest.

pipe-A-DP-1
pipe-B-DP-1
pipe-C-DP-1
pipe-D-DP-1 is not possible
pipe-A-DP-2
pipe-B-DP-2
pipe-C-DP-2
pipe-D-DP-2 is not possible
pipe-A-DP-1-pipe-B-DP-2 is not possible
pipe-A-DP-1-pipe-C-DP-2
pipe-A-DP-1-pipe-D-DP-2 is not possible
pipe-B-DP-1-pipe-A-DP-2 is not possible
pipe-B-DP-1-pipe-C-DP-2 is not possible
pipe-B-DP-1-pipe-D-DP-2 is not possible
pipe-C-DP-1-pipe-A-DP-2
pipe-C-DP-1-pipe-B-DP-2 is not possible
pipe-C-DP-1-pipe-D-DP-2 is not possible
pipe-D-DP-1-pipe-A-DP-2 is not possible
pipe-D-DP-1-pipe-B-DP-2 is not possible
pipe-D-DP-1-pipe-C-DP-2 is not possible

Bhanuprakash Modem (2):
  tests/kms_flip: Add support to handle displays having 5k+ modes
  tests/kms_setmode: Fix the corner case in handling 5k+ modes

 tests/kms_flip.c    | 42 ++++++++++++++++++++++++++++++++----------
 tests/kms_setmode.c | 12 +++++++++---
 2 files changed, 41 insertions(+), 13 deletions(-)

--
2.35.1
