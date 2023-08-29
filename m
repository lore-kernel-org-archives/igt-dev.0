Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B471510E046
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 07:31:40 +0000 (UTC)
From: "Dec, Katarzyna" <katarzyna.dec@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 29 Aug 2023 07:31:03 +0000
Message-ID: <IA1PR11MB609799C4C8B843F396D2118BE2E7A@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20230829055835.1750432-1-himal.prasad.ghimiray@intel.com>
 <20230829055835.1750432-3-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230829055835.1750432-3-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/xe_uevent: Update
 documentation fields
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

LGTM
<Acked-by: Katarzyna Dec <katarzyna.dec@intel.com>

Kasia

-----Original Message-----
From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>=20
Sent: Tuesday, August 29, 2023 7:59 AM
To: igt-dev@lists.freedesktop.org
Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Dec, Katarzyn=
a <katarzyna.dec@intel.com>; Kamil Konieczny <kamil.konieczny@linux.intel.c=
om>
Subject: [PATCH i-g-t 2/2] tests/xe_uevent: Update documentation fields

Update Category, Run type and Test Category fields for test.

Cc: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/xe/xe_uevent.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/xe/xe_uevent.c b/tests/xe/xe_uevent.c index 4dc49057c..1=
ad9de909 100644
--- a/tests/xe/xe_uevent.c
+++ b/tests/xe/xe_uevent.c
@@ -5,9 +5,13 @@
=20
 /**
  * TEST: cause fake gt reset failure and listen uevent from KMD
- * SUBTEST:fake_reset_uevent_listener
+ * Category: Software building block
  * Functionality: uevent
  * Sub-category: GT reset failure uevent
+ * Test category: functionality test
+ * Run type: FULL
+ *
+ * SUBTEST: fake_reset_uevent_listener
  * Description:
  *		Test creates uevent listener and causes fake reset failure for gt0
  *		and returns success if uevent is sent by driver and listened by listen=
er.
--
2.25.1
