Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869F6C3DA45
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 14:02:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2157310E220;
	Thu, 11 Jul 2024 14:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LujiUMUU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E20910E220
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 14:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720706527; x=1752242527;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n2LjuIbth3ZQcybv4NQGJHTA2EWdqLBQWFJvl/BzzFE=;
 b=LujiUMUUf8uAMwzPJJduADzgI5DO2TVHL1dXCdOT8Lnxg4n0hwJYfMq1
 GC8nUXTrypkH13rRNFy8kAoAbD32rjHRF2hfoPZdg6a8Nh6D6e1gVxKHu
 mxVoIHyAibShkz/lo01P6qUR//RNhdThs5rkDy5IkvFZ8gCqvNHx81o/Q
 DpE8GXJe8vq8yB6377wndtb+WDpsV7jRDCN8hU2GO21K1EwRNslCD4gNR
 rpfZeHIu4pRxGENBbMMf8LSreJZCcyWrbi1oA0xe1LqsXOy9CIrNIfRZJ
 CZlbfnVQKgExaKfM2JLLIKE3HDjWoksVicC5E4+ZWNrTJ7NeB+ZBPdDG7 w==;
X-CSE-ConnectionGUID: jQgVBzbhTEeOayo6k9a5WQ==
X-CSE-MsgGUID: UUYO0PkgQZCye3tkprmtCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17954430"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="17954430"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 07:01:41 -0700
X-CSE-ConnectionGUID: DIVqKOEvQqGWNXk/Xl4Z1Q==
X-CSE-MsgGUID: 8/jrqCBJRayfGR9Akmb4FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48550549"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 07:01:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 07:01:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 07:01:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 07:01:40 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 07:01:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uw4OraBrKeQg3CPG2DlsUS2eu9Y6S/N90f5sguCetr/S2knbdtzVxnFTECeVCZ67eBTOVIcivIFU9qQb01gefyQ5lU9MBjguNVvjKrEAkMpl0poqdL7v3Eb6aze7wAkxaIhk6OWCoaxX4/KNXefU2ZFeeRMb7FMiWgAWdJOnfC0A40Ph8+5nTKjh7qCEFw8f5iN28NGEfoUHebWn5/qNKCoptoGsQOCbHULs1XNAFwS9E6iFLy4nNYSjiJRfcMsfbmHpvwSuataxXKGFAyoFEu6Jo4PvYnpQ69sioHUrLAn6lLNXL03SfW6o4Q5BrFPTTOz41hka0YL1k7rfY49hmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVxv8egq0fX4HPxphfIi5OgEua5J6hp579p6qVMbxv0=;
 b=kZ9kukE/N9id1ZpTqqlkQm5RQrgmsi51YhGYwUvFIsGb2x9ItXveUkqxRuZuqu7d06xK1ZnjL32QGj2ro9ntgt3324eIzpvDXzYE2UgpgQre5L75SnVCUcvUxs4zj5B4JnPX3TGelmvyEJh1xneQPgoYJhEX4GqGfx61+x73FI6ror8YhXvqwHMOQ0cOEu9enilkoL4qN8TcaqsiTeM9x3tq1miWAzvecbdv2Hu7WzNakrlU20257hFjZ0dG+0RzLdAfHFzI2T9yEmXERoFi11rEDHjNEUHaegZTQ9F3FE7SK1VI0W3z+9x4F7zVelW9LvnmPKeX17/cQGEyuZ2bww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB8597.namprd11.prod.outlook.com (2603:10b6:510:304::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 14:01:34 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 14:01:34 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, "Laguna, Lukasz"
 <lukasz.laguna@intel.com>, "Kolakowski, Jakub1"
 <jakub1.kolakowski@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 i-g-t 0/2] Refactor sriov_basic test and blocklisting
Thread-Topic: [PATCH v2 i-g-t 0/2] Refactor sriov_basic test and blocklisting
Thread-Index: AQHa05qGRx6PQiwL30+szhzmUSUT7LHxjjJg
Date: Thu, 11 Jul 2024 14:01:34 +0000
Message-ID: <CH0PR11MB5444191B011F19A449F42D8DE5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240711135858.975304-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240711135858.975304-1-marcin.bernatowicz@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB8597:EE_
x-ms-office365-filtering-correlation-id: 60f7764b-26be-4e31-5393-08dca1b1f985
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?2cZf9IAAL9c2zWmWhPv0YWpl5zMz9ONhLpI4rR1pRnc59zeutJyyj2+rTB3v?=
 =?us-ascii?Q?Ho5fnuWrkKLmVvkvtA+Pv0aqhk7F42XZIWz51NB1KiUbUwxygnfy8in4q9DY?=
 =?us-ascii?Q?isccX4yc+ZAeX6WfzVtbg3tmfqh3z3ZyCc7C1i32g/iMOksFwltNgj6DAKwd?=
 =?us-ascii?Q?DubbVxplf1pTYKzJxrobVyZHMqb27ipmbzb4dIQx7iatZe6vOfKx3Rec60IF?=
 =?us-ascii?Q?fbXwJnkBiijIudpHuCiHS29QJoGzuZw8sPR/7tuvE+nHa8mgMxYQRmytdfmz?=
 =?us-ascii?Q?P0h8WYyQ8RlaohZvzJt7RwzMU9XbEFt/fevTrLROPj/h6k1swtgtuq+hQlnU?=
 =?us-ascii?Q?uIdYHSqY2r/pA55dFh6KsebN9YurAqRGJrUuPxw8ccCW1x4+z0Rdimdsl+oy?=
 =?us-ascii?Q?CRzZ6vzSVdmVXeGaRS9ZNsEFzKZTqffXykpLdHUrHApsybuoomhXZTY4XPT8?=
 =?us-ascii?Q?jpr1OtBRYQ+0rHRD/g38guPDIQhISPOTfnboLRQYRLc+oSBrUkaqv49T6JXc?=
 =?us-ascii?Q?cAIusTL6dieWghSS1PdM7TikcqHGQr3FoAdf5A+oMPsfIRJJOZqNseh88/Mk?=
 =?us-ascii?Q?/wTdyepwHabHRhbbo9Z02oXbZ8bCeeaW+xJqxurBoHlbOdoKDGULxO2aInQv?=
 =?us-ascii?Q?vKDqSb8xbu2g8j4RG+LkyZuUTpxcIbv1g0rMOl9PUZAPuGDrSD5P7XsrGwFb?=
 =?us-ascii?Q?9lQlp7uSwumzk5KwE1ZyQmXVURQybxB0hCNahKXRPpLTRwnwV/GxML0WXja2?=
 =?us-ascii?Q?WI+kfXFy8OwAPd94jJn+pRf5rIGLT9BT5PV11cs9VyCK6eSa+l+Ut3xr9L/x?=
 =?us-ascii?Q?aX5XUyJSijPztsnzn8ii0akM3n2LaWg7sGDfm/Yau6euYQUc/LtUCHVdzcZB?=
 =?us-ascii?Q?jO9FiZ9QCDWTAy3gcOfJyvw5r4++jkavgY6ub9Pkxj4I/+vs/2szjWploNAp?=
 =?us-ascii?Q?mygAli+yDuNAdKQ8e0X9XHgkCjM76+Qwn/vKW6Q6huNrgL050K2f7L0gL3X6?=
 =?us-ascii?Q?02b/HdghVfecEtQT91nAaMrdhwMi5s5k4C1rgmFAIhcA5FLzZ/x1Ut2fnLEQ?=
 =?us-ascii?Q?pHJ1NkG6jc5ZlTw3mSYW2BIMQBB4dcI4/7BP9XLtfNyqT5Y+NVJ4DD4UBCMy?=
 =?us-ascii?Q?iNuqaCSVBgg5RIvsHhH8K7grOSEcYCnI6YSHe4CVIiBOJbHhL4RAAw9L1sio?=
 =?us-ascii?Q?Wk3OAlPVw+dPilPu55VNAzFLqLHwF8eotB9dlPD8Z4pICD0v3j/Sncz0oCPY?=
 =?us-ascii?Q?Ry8bpziqNNgsSE2/JPQ6cB2g+CaJc1uAoRkEkpeO6hlZtYfGyek+3F3nS/XV?=
 =?us-ascii?Q?ql6y7z/9o2sdrimeaPwbzZo6s1MTjliMMUdQEe2bdmUQIk/BtF9YdPTYcn3u?=
 =?us-ascii?Q?jvHuKVBJ1c5fJNvTbcVEFkyrvOx22ryNkr2zLq26aTyQdGA/Ww=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VbHEdiuOm6ihQil3qk9zD30xjuRzoEe6Q0n+6VVv/SMWg67iulGrnVHECK+b?=
 =?us-ascii?Q?TEYz7tWtwIuXDensEABwGN49ygVLZGnNr4zHitlzqSuL1/RgyHvCWv7VJ4kh?=
 =?us-ascii?Q?jqkMtCuncozmro4G5ygLv7NQ3BBoMzcGaafTRppcuOFDHUJc7X/wo3u7qws1?=
 =?us-ascii?Q?BuTfVCmq/gTrH8mfByaDNYh92M6Khl4DTyedh3Y91yzFsR7VgEU8clbG6q+X?=
 =?us-ascii?Q?Azn8jxRE1fC2K+f+c3KepMA11EXrgO8wNN9mnKFVfUnhi3jb/fH8RHXiCcDx?=
 =?us-ascii?Q?XSWGpQzcm0p+KPv9pT0IAOEPmfsbjS/DWQxIGScsNMu3Ae6PDR8keDPcDBTp?=
 =?us-ascii?Q?k+UO6XqTbx5Cs3oIPLQXQvNpJ4aSgO9xzLvlfd16NtrY8XowCZ0neexEOqO/?=
 =?us-ascii?Q?mLaHikBpkRLUrOToBizZ704XwuwCIbJQgwzOR2e5/R8gNLXfgxFsaqa1/pt+?=
 =?us-ascii?Q?BSHK8Ryf37M4jwK9YFCm1HaXG5H20D4u40/wxls00PxrCHTIOP8JRZ4dArXS?=
 =?us-ascii?Q?BsZ+CVdvMvzoeJz/YJor3uQICakhpm1ttOTrAlnjQ12BwuQ9sbHQSIYH/Y9w?=
 =?us-ascii?Q?KUgp7rh09ZwCnzad1hotS3PvYUPM96t2ZNoYUggyXoKZQgzFyw94LqziQiHd?=
 =?us-ascii?Q?kUtzDLHNoVYt/qZloE4YdQt/jti5AdVp7ehotonXdmHLSFq7pr/Xi1nC+RlN?=
 =?us-ascii?Q?cumJZJR3T7nZffumNw6diP62diYVBqXBoffmauUqYwy/bYLd/MsRFEcloHch?=
 =?us-ascii?Q?f5qKvpyoEqH3XwLzR0L2Dpp3V+9nHLVtbund6NWKhtmhJRt2RupVSeU73yJ5?=
 =?us-ascii?Q?MY7jZiaHd2ICexlnCmB4pDnSKI03pYyEFF6+Ldr0VN6265ymy69T+0XmUPnP?=
 =?us-ascii?Q?mDYtmRm+vtoHWOwRC1IpNFwMpmgP3yztNlfXgikYwl4leiF/YSvTmdMxNkeK?=
 =?us-ascii?Q?VXGLLfrnU6J2Ivx3lBwUcj7Api1NLv0EQOmU3IJEx3Elt91I56oao92URPmS?=
 =?us-ascii?Q?uh1EHLiZpE0WBXNuT4PU/1AYKx1GNfoFkrMsiWYoVdJKgoqgopAvxhj506nC?=
 =?us-ascii?Q?qNcatU/MqQb8KVQ7xZiqkWBQYRCylsxUnJvVIakDvx+1giDlbyP2QYGbJPRi?=
 =?us-ascii?Q?ucQ0iMWSavnjQlgIbLIBKIXETlcMUe4nj0JOR0bXpYji5RWMhNgMRZdikdKh?=
 =?us-ascii?Q?AkMM1nhZBSCHyQT8U6Q6omgmqcqKaqrpF00KFASCykNSyg7tNVgs8b9ldOQQ?=
 =?us-ascii?Q?eb/jiTZZnr41JV4zHZRMYNckaV9kwI9JmVuwsYYbvq/qlPCujlKa4OXFcQUC?=
 =?us-ascii?Q?TY3JL146IZpOMyWy+zKs9v6/xONIbgC6hv0jKq580NQILQ83SFG2SK3k8MH4?=
 =?us-ascii?Q?2rj09g4LCorvcpgPsn9Wbcf6kE84URGeRhdPpv5noqqVcIeXmElahXHC4QAm?=
 =?us-ascii?Q?gSogyqvmr4w5tqjZely60Tv7ojn8CiUHT3WogLE7Y7dyJ+8PV6FhWLFfm1Mi?=
 =?us-ascii?Q?P2EXg4uxEEX1VIBjkJYQtCHbstgrSU6VEjzSqEeq4Gl0CxTRWJqaTvb4PM8E?=
 =?us-ascii?Q?lJFv6IqXi77JAQEWgeMRwmS+PQTxhQrfVVOh4g1j?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f7764b-26be-4e31-5393-08dca1b1f985
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 14:01:34.7084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kdIeeuvZK5TzUFMkJFR+yc+BLP9DaEt0NKfya0LL421grE9fN5BKqr4VGPCQGtuvW0Cdi0c21Nh9jrbEirte6+QbUZebfnJQtwC13zeCWqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8597
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
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>=20
Sent: Thursday, July 11, 2024 6:59 AM
To: igt-dev@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Marcin Bernatowicz <marci=
n.bernatowicz@linux.intel.com>; Adam Miszczak <adam.miszczak@linux.intel.co=
m>; Laguna, Lukasz <lukasz.laguna@intel.com>; Kolakowski, Jakub1 <jakub1.ko=
lakowski@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Subject: [PATCH v2 i-g-t 0/2] Refactor sriov_basic test and blocklisting
>=20
> This patch series improves SR-IOV testing within the intel-ci environment=
.
> The first patch blocklists sriov_basic tests identified as overly stressf=
ul
> or time-consuming to be executed with all dynamic subtests at once.
> However, these dynamic subtests can still be executed via testlists
> (refer to the BAT example below).
> The second patch extracts a specific subtest to simplify blocklist
> management.
>=20
> Included in the blocklist to prevent simultaneous execution of all
> dynamic subtests:
>   igt@sriov_basic@enable-vfs-autoprobe-on
>   igt@sriov_basic@enable-vfs-bind-unbind-each
>   igt@sriov_basic@bind-unbind-vf
>=20
> Tests retained for execution:
>=20
> BAT:
>   igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all
>   igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1
>=20
> FULL:
>   igt@sriov_basic@enable-vfs-autoprobe-off
>   igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all
>=20
> v2: - updated blocklist, corrected line lengths
>     - improved description (Jonathan)
>=20
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>

Reviewed-by still stands for both patches.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt
>=20
> Marcin Bernatowicz (2):
>   tests/intel-ci/xe.blocklist: Blocklist SR-IOV stress tests
>   tests/sriov_basic: Extract enable-vfs-bind-unbind-each-numvfs-all
>     subtest
>=20
>  tests/intel-ci/xe.blocklist.txt |  7 +++++++
>  tests/sriov_basic.c             | 16 ++++++++++++----
>  2 files changed, 19 insertions(+), 4 deletions(-)
>=20
> --=20
> 2.31.1
>=20
>=20
