Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB126EA97
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Oct 2021 20:32:53 +0000 (UTC)
From: Casey Bowman <casey.g.bowman@intel.com>
Date: Fri, 15 Oct 2021 13:32:36 -0700
Message-Id: <20211015203238.133163-1-casey.g.bowman@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Changes for typical arm64 cross-compile
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, petri.latvala@intel.com, ashutosh.dixit@intel.com, wayne.boyer@intel.com, matthew.d.roper@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

We've used Docker instances for setting up arm64 configurations
but I've found that this doesn't mesh well on a typical debian-based
setup (Ubuntu 20.04).

I've included a couple changes that change where we look for the
pkg-config binary, which in turn looks for our various libraries,
along with a change that avoids breakage during compilation due
to a system header ASM issue.

Casey Bowman (2):
  Alter arm64 cross compile pkg-config library selections
  Avoid using the sys/io.h header

 meson-cross-arm64.txt | 5 ++++-
 meson.build           | 6 ++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.25.1
