Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F4810E0CB
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 15:23:12 +0000 (UTC)
From: "Dec, Katarzyna" <katarzyna.dec@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 8 Aug 2023 15:22:36 +0000
Message-ID: <IA1PR11MB6097BD7206A314661253436BE20DA@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20230808144913.600790-1-himal.prasad.ghimiray@intel.com>
 <20230808144913.600790-3-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230808144913.600790-3-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/xe_uevent: Update
 documentation fields.
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
Reviewed-by: Katarzyna Dec <katarzyna.dec@intel.com>

-----Original Message-----
From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>=20
Sent: Tuesday, August 8, 2023 4:49 PM
To: igt-dev@lists.freedesktop.org
Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Dec, Katarzyn=
a <katarzyna.dec@intel.com>; Kamil Konieczny <kamil.konieczny@linux.intel.c=
om>; Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/xe_uevent: Update documentation fields.

- Update functionality and sub-category fields.

v2
- Fix compilation failure.

Cc: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/xe/xe_uevent.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/xe/xe_uevent.c b/tests/xe/xe_uevent.c index 91b14990a..4=
dc49057c 100644
--- a/tests/xe/xe_uevent.c
+++ b/tests/xe/xe_uevent.c
@@ -6,6 +6,8 @@
 /**
  * TEST: cause fake gt reset failure and listen uevent from KMD
  * SUBTEST:fake_reset_uevent_listener
+ * Functionality: uevent
+ * Sub-category: GT reset failure uevent
  * Description:
  *		Test creates uevent listener and causes fake reset failure for gt0
  *		and returns success if uevent is sent by driver and listened by listen=
er.
--
2.25.1
