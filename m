Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92D16E49A
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Oct 2021 21:26:23 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Wed, 27 Oct 2021 00:26:16 +0300
Message-Id: <20211026212620.2718277-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] lib/igt_fb/tgl+: Remove CCS FB layout
 restrictions
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
List-ID: <igt-dev@lists.freedesktop.org>

Some restrictions on the stride, offset and size of TGL+ CCS FB surfaces
are not something the HW requires, so this patchset removes those.

On ADLP this also removes the main and CCS AUX stride restriction
required by the CCS modifier uAPI, making the uAPI of ADLP identical to
that of TGL.

Because of the uAPI change above the CI results for this patchset are
only valid with the corresponding kernel changes which I'll submit later
adding a reference to this one, so the two are tested together.

I tested these changes with the kernel upcoming kernel patchset on
SKL/TGL/ADLP.

Imre Deak (4):
  lib/igt_fb/adlp: Remove CCS FB stride alignment restrictions
  lib/igt_fb/tgl+: Prevent CCS FB UV surface offset overalignment
  lib/igt_fb/tgl+: Remove CCS FB 4 tile height alignment restriction
  lib/igt_fb/tgl+: Prevent CCS FB AUX surface size overalignment

 lib/igt_fb.c            | 87 +++++++++++++++++++++++++++--------------
 lib/intel_aux_pgtable.c | 66 ++++---------------------------
 lib/intel_bufops.c      |  2 +-
 3 files changed, 66 insertions(+), 89 deletions(-)

-- 
2.27.0
