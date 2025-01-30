Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70418C0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 09:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A78D10E2F6;
	Thu, 30 Jan 2025 09:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kopJqVW3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E2410E2F6
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 09:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738228365; x=1769764365;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9sUwY0H12KO5yiHaHkPJHVJf1bBfqliQpJFVBLvlUSQ=;
 b=kopJqVW3i7kvld5KXcOT5gckrSdEWUTRw/9KOMOGJ0+HKA/Vto59oFy1
 EgoKOAaXWUuCVsbS5uSMicf3++DPtUDj5SjmgooOoI55NHbqVgHqWM6AF
 oJkJQKGvV+L0fPZRATZqyfS46q5hzSARye6Kku8u4pTpW/3zKBWVdSHHf
 pWMH+md1rEDZu7uCQmP6t6jR1rOyCgzTeWIQe6L1O8ytTP4btmDtCAh8k
 UYYgiCcLgFx6Z839AwRzDyQg3wHjLbhbNnfHcM/FkyDbmbTp+P2v9GbyH
 ocU3ppk6ccezKc5Yr0efwEcv3kgP0kLEMVk3VvARobh8VxNPkIiJo2cps g==;
X-CSE-ConnectionGUID: 3+dyASzjTkm9VuVApPsnmQ==
X-CSE-MsgGUID: JvA6NCNYSwybpvC02UNTow==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50182986"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50182986"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 01:12:44 -0800
X-CSE-ConnectionGUID: PBxU6V7QQp27f2RJItNL3A==
X-CSE-MsgGUID: 4lg/aVevRbaVhduTcQ3uEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132541962"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 01:12:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 01:12:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 01:12:43 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 01:12:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pG8Ah2hJtj6YywVQOVbIFzesk6+7RQnAwu3juBSwJi8nn5hu7KbOCHomUHJ3W2g8VTNqw2k3iEOfDIcj1yX0Go/kuQXGBDcaKu21BukE47ia+ZXLrDzR6znfhFz/q1AFpF5V8aWiAWZi6+vImkJ5SZVOBCabDlamHyjD0tt5nML0jyeMdbTdUN3oOlDDdyNlZSqIl9qgQlrMNUS4m6Gcui/3EcmcJL5MQSAOnLe7dm+a8oUdwjDs0Xx1y3Viabagtx3kWuPw0E6BRXVg3ro2pqZBY0VYAxacpEOKcgswle51hpL5OIXVxqjaypPvztet+aBZKEw4SCdiTi7VxyFZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sUwY0H12KO5yiHaHkPJHVJf1bBfqliQpJFVBLvlUSQ=;
 b=ms46nwQ8KOIL96JI7IMB1uRNVOhvaoqJlCoAiauKoSgoGt4UZpExL9qD2sfE/lCzak1NsVWPm88Z9P7ktgXyHOMukZ0x0fjAlgFIcZA589qBnNIFNPylMlhmlFeDeRfvTkrTbMMCIZX1VNn9Feuwd6A6+/VvnfFrKTdX8e7b+JEfzxGIbLpVXCGvg8Wldzz6/KwhXXXfJzGKxqBJ+kkp7APIR9L1GUwWUecW4UVVM0Z4bIxxSP9yOOG8LDn65m7wTbQMFonFDI7QQQwpH3Y7u5VKeFP2R5puSf3I2TYp82PYZXj6hB5jPci7Xy0Q8FmJEXwfyIryXIGjoL7dzLemxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by CH3PR11MB8413.namprd11.prod.outlook.com (2603:10b6:610:170::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 09:12:36 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%6]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 09:12:36 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t 2/2] intel-ci/xe.blocklist: add i915 specific tests
Thread-Topic: [PATCH i-g-t 2/2] intel-ci/xe.blocklist: add i915 specific tests
Thread-Index: AQHbcnMCNTIDtI0fn02C9H1kRQZPsLMvCRpg
Date: Thu, 30 Jan 2025 09:12:36 +0000
Message-ID: <PH0PR11MB4806F41956946D2291FB77ACE4E92@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20250129174153.3654881-1-jeevan.b@intel.com>
 <20250129174153.3654881-3-jeevan.b@intel.com>
In-Reply-To: <20250129174153.3654881-3-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|CH3PR11MB8413:EE_
x-ms-office365-filtering-correlation-id: 4dabf155-97b9-490c-d131-08dd410e3d15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?/PF1l/X+UFEcoYBKxGf8BoJmkbM/ZNOtMKjWlTcI5jS79QxzPQpXwRunoeDL?=
 =?us-ascii?Q?VjCaMGscLJc5yWsh0MsDu7flc7g3Xd/SqDS13i9W4ey3Y0UgjJViGNmFZWOr?=
 =?us-ascii?Q?TY848/yjyUjuqrIOyk6RrtyMmJNVCLXnY8mQ2vYqVkGYgurluKERNiXLL2wA?=
 =?us-ascii?Q?OhHYYC++8YhMxyXRcwV8h7aP0twodjLwAYGo/J4nSLCgzgZ2H+VXwFxt3a0R?=
 =?us-ascii?Q?tnAVMGUSWH0w4Q/IsA2nXAYbiRJ3fSi5G21bhK+GhCmrBV8NQf/hdnwBzitc?=
 =?us-ascii?Q?KVeh/Rt/GRymDPr77qzfKkaFJFIxlm0jnrGMPlxvAE0rDTQBU/5L02eA03fp?=
 =?us-ascii?Q?gw3Ki+5oMZavzkIdXMum9/zpgwhmCcO+gODbKGoItQk0RL8Bbx+nZixbJgkX?=
 =?us-ascii?Q?IBolP1xiTTBL9JzaNbpLCXMsrLnBx7epLalRmcgHn2EhJjYsljLQ33HxeDpV?=
 =?us-ascii?Q?tbMLy3m0j2FtovWqXmeQEbmEtsUazfK2hNLcOI85GIKo2eI78jum3DrOoZJs?=
 =?us-ascii?Q?8A+D+dz4jCDvtvm8kOnRKpo8TifGy2W04vNcGpZ3h/R21d6F8rJPeAt00DsR?=
 =?us-ascii?Q?8veqH18Zf5Gp2mdsL98Ja8A/t6qPfHbZ/uajpfoTQP1/QCeKkGVwvBJrwGn2?=
 =?us-ascii?Q?wMs3974qBZJKefzvvMmjK22LVlw4G2hYNLtc/7+J4Z0aephPvAZA/Xa7UYRA?=
 =?us-ascii?Q?sxtiitaHJY7IEOwTTpJyR10/5Nt6J9XdgvHRxC3Cgu8V7sGll0Cof1UDqurg?=
 =?us-ascii?Q?//lDSBZAwe5QxNTTu5wbZhLdFrQZhXObNEFcnJWomAqDVDS4vpDaKD6rmUfl?=
 =?us-ascii?Q?LyveESJPfWFwaYVd72o4HOsZR9ovIO5nPtJL11Hyke3hmKzbt13PTAVGx8R2?=
 =?us-ascii?Q?ng3ErbrZWOicn4Wf9699OiMAIZr4PtxavgapqtFoZWtDjX/naLBNrxAe/UQo?=
 =?us-ascii?Q?163MkskPm6Gtc7PI6oRYg00bFGBS10kaNoGbEw3/r1z3mrwVtkJvvJjgeiUM?=
 =?us-ascii?Q?5sBqPIA2A7Sq4DylXC0sRWtNXy37QHlMhh2rjDsrkUthMIuiC4N0BTeULCRg?=
 =?us-ascii?Q?6QL+PmhJvpoa685TFiY9htFMzfAlDKZMxQ3Vj5kdsvMbUGdVaZbaAKvW2kvt?=
 =?us-ascii?Q?ogC+pkXMCH9zbFEFetv8rQek95Fyq7IgFw+dpuyu0koJNOfZ1JdEy+B73Ol8?=
 =?us-ascii?Q?Lj23GvwCW/DhH4EtWbKEYoqjco56okWUwMpGEBtlWtgToZmNqdwLnT+oSBoD?=
 =?us-ascii?Q?TktKw3EmodACd/1GEsZex7D5WAvaDA54hc10JgVM8sQwhccOODVr2f/OLXZc?=
 =?us-ascii?Q?U7aCfxAdDeQQgzhAdo5Y+x5dB+Y379Fn594lyQHVyOXC09LZuEUtg8RI/UMq?=
 =?us-ascii?Q?AlH8WGNjthwnnZllY/dzSjQ6GE470vUUKUwOpvwtCJBjSMKhFMcz3n3HT2KI?=
 =?us-ascii?Q?QDNS1U4KK/KsjkHe0T37XQUbBsvY3q0Y?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sBKah5+oUDsEH7uGpOCCV0RPvrR31o0UYezcn0ma60JerL9wplWQM3OawmT1?=
 =?us-ascii?Q?1Zwp4GmECaPgIK4GE3I6EWiXMs9/8AJs4/qxX7YpnDDdHq1wzz6ti9MAf4lp?=
 =?us-ascii?Q?luht+y8iinU4AUoKqUVrVbE1t2p2sDUmrxaiVayTsLoyKLA2G4udZO6RmNxl?=
 =?us-ascii?Q?Q47Piy7Nei50Hzgq0oLbJQHQ23qv+35K45JZSbeC/d1L+il+WvN8chPWywYn?=
 =?us-ascii?Q?SsnuU9vj3aZN4CdsoJeV500/xapUmz4kQqEPuCe0FeWtxINUblwfu1jtypWx?=
 =?us-ascii?Q?5OwrjuAQwPdbWslG0I9slUui5AQu1CigLnhTUN31KC+Uw1VlbK0eEKQbP84a?=
 =?us-ascii?Q?3P4h715pU2iPYQcwPPYJFIVMLHR94k4pLZxUDM6cfFJFv+918KM76rPlKC5Z?=
 =?us-ascii?Q?JO8NwtSenaFwH3lf/rCvJsI24MDh3BpT+RIngQGcaBTwgquAn6W9sB2Hqw3G?=
 =?us-ascii?Q?15wg5qo2oK6uGE5S3wkVQ9hdrXteWYj+bZ9roHZ/wDsNxcLyLKbh/sfzlTEc?=
 =?us-ascii?Q?wW5Johz1UTWBLySDXBgfLq9YKoK41/9xKa7iz0zRmvq8YgYS+t8s9QOGDmU9?=
 =?us-ascii?Q?8fT6iuiKwXf3Weow2ZfU418shVn6Rdno26nFydSLmRm8n1my+blIjAQ1dKci?=
 =?us-ascii?Q?t3/01KSSiBO4e4/xXocXYh2iPmyIZXbpmxtI+HiNdM4zawFLq8n+Cw1P4bk1?=
 =?us-ascii?Q?4RBqo3R1C8A9HBtyEyhNvolDts5Czu+HPU/MBNGVpB2FZfsfS3e1pRvWe2Uw?=
 =?us-ascii?Q?vBoM2mVwjJ+GnoKT6cGxCZ828qes1fMTXYv5PglgkpGckgy8bWHNWuF3RL6i?=
 =?us-ascii?Q?DmQEkWCY2HWTIua/21pyU2yHvWPKpbZaYdOFrScL8Jiy/SNkZu6gesTzkr/m?=
 =?us-ascii?Q?jvHHLc33oaPQbLuzhuZLVYDn4eBEBkjITOmtuKXTx9IrNIZ3o5UQZD1GMKYP?=
 =?us-ascii?Q?l1CV9TfGiyUay5d5eFtcu0w+g4BEk8zlKsVxv9ONLqhiyVXEPE4wFYOPe/h6?=
 =?us-ascii?Q?p8dFecab6BRbgVGV2mm7QxroBWKNSSh/MY2bm71m3+yIv4Q7zVs4Lj4J6vxL?=
 =?us-ascii?Q?AOwml7xwAdIg9D8eRekUMK15i7AuHfEPQ2KoJqn0KdIVtppD4E01gVgo3iMX?=
 =?us-ascii?Q?EOcwS6Gm3m99EBWbXyLAL3KSFdMLL6Ip9w90aS9hHelbFJjmU6bgWsGwuCkC?=
 =?us-ascii?Q?0EbPXJXlLcq5StQxm9iuVeZ3lBW77wwgB6lYQ8AI4snebfH0WXeIe64NlyvA?=
 =?us-ascii?Q?qhj5UXuGGLwHALQiBuT80vDb3MXsFwN4Dz92zbONaz7A6JMHfaHGYMAZ++3K?=
 =?us-ascii?Q?6eWKHy92uyzboe7WyXVsNLFhtlkj0lLZVLchnhkUjFiABYiq3hMXqNxgaM8i?=
 =?us-ascii?Q?u0aE6X90YWWgcpXWuuO1WaLHJr1taNaKEKrkOLjqDM3r7h5+WEn438HXBfbx?=
 =?us-ascii?Q?EfegY8tAPL1RE70wTw90MyH2dvbQZ2q+wny4yE8xH+KJCmsHI+F0dqTGGJhc?=
 =?us-ascii?Q?A6Ch4Da6VpzV5IZrgZBiN2yI80OlzNljoXDabo6USqQEtvjUfxRoVQPMaZkA?=
 =?us-ascii?Q?UADy3RyaBh4lPd7gAZyoDbbDhn8cWNn1hGHuLci+JTTVw/Rv6umqB/2FbVwv?=
 =?us-ascii?Q?6A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dabf155-97b9-490c-d131-08dd410e3d15
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 09:12:36.6350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pLo49A83lbqsGoXil95cmYh8sDCc2Op5nAiSXQwWSxEnlc37kjUdWiwofpk6zvixXPmLM9XLhmbcSk6k52Z93FQ5PX6iPyDoaMXY8fMnqEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8413
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan B
Sent: Wednesday, January 29, 2025 11:12 PM
To: igt-dev@lists.freedesktop.org
Cc: B, Jeevan <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] intel-ci/xe.blocklist: add i915 specific tests

Add i915 pm specific tests to blocklist.

Signed-off-by: Jeevan B <jeevan.b@intel.com>


LGTM.
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.=
txt index fc270198f..6964628f1 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -74,6 +74,7 @@ igt@kms_rotation_crc@exhaust-fences
 igt@kms_pm_lpsp@screens-disabled
 igt@kms_pm_rpm@(fences|fences-dpms|pm-caching|pm-tiling)
 igt@kms_pm_rpm@.*pc8-residency.*
+igt@kms_pm_rpm@cursor.*
 ##################################################################
 # KMS: Yet to add/missing XE support
 ##################################################################
--
2.25.1

