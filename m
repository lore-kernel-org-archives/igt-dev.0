Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058DCD473B
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Aug 2022 12:51:05 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue,  9 Aug 2022 14:50:19 +0200
Message-Id: <20220809125037.1231032-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/19] Allow building igt without graphics
 dependencies
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

This patchset allows building igt without cairo and pixman, making its tools
conveniently available in compute-only environments for debugging purposes.
Building tests, overlays and some graphics-dependent tools is not available
in this scenario, but most of the interesting stuff is in there.

The new graphics=<enabled/disabled> build-time setting decides whenever igt
requires cairo and pixman. Disabling those dependencies prevents transitive
dependencies on a large number of graphics-related libraries (X11, etc).

Unfortunately, previous 2 patchsets did not get reviewed - resending for
easier testing.

v2:
- Merge the header cleanup patchset into this one
- Rebase onto current master

