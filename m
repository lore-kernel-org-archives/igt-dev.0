Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800FAC3DA6D
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 12:24:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1630610E1FF;
	Fri, 23 May 2025 12:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jCvOTBsn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D23D10E1FF
 for <igt-dev@lists.freedesktop.org>; Fri, 23 May 2025 12:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748003054; x=1779539054;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ehSw/7mS8kCE6T3cqiIf/mwbMKbdGHM6faAQ+L7nf/Q=;
 b=jCvOTBsn7hj6u0h4jHe2Zqqf15CaGPIHwsoP3UuWn0WHQzdpYMBGQN4h
 xn6g734wxRYbNxv4xSWn1DBNkFLKbmKGbwGPcgYbxciYSbHHOa6FKtjDt
 /y9nbpr0mVtz6lAHJHBSZdV9hQdd5janICvVFq7//bTljRqPo2sZOFghG
 Oa/wlIj/jRrwoVRZ3GuBJEuiHNZ5ctyP2ESOnhVJjIxIhG9G6Tu3hQGl+
 o6aVuX0EXL8LXbpa+6ExA3tpv2L1bSDzbpWXbDZErBJ+LTmvnXz0SjgxN
 EgEh1iY/YZaUSdDpnIyS4Wi55lEZHQbs7H3G7zLwUYTXdamlhfSpExRDn g==;
X-CSE-ConnectionGUID: qdW+TEJtS5ifhVaimidNMQ==
X-CSE-MsgGUID: LAfSgfcgQkmQbEQdbZkgNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="52686049"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="52686049"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 05:24:13 -0700
X-CSE-ConnectionGUID: s9Y/WsBCQDeJDRFw0BAP/w==
X-CSE-MsgGUID: sqW+MVZKTjGCOLNgFre6yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="145080324"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 05:24:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 23 May 2025 05:24:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 23 May 2025 05:24:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.59) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 23 May 2025 05:24:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAtySwJOuFLR4/56gb4dqFymS+CP7HOdcjts/4ly56vTr12wz+upt4aKC25kHb2fEtaAOKEI+qnvCpDsJlpf/QtzlscVL4BRm9g4yeJEhTTmrd/YbjTtfAWw6lJ2pGwIZFXZN0IRmqa9g+ZbD5/Qz5e5VuewUM5I/o5FaIsQPdSs4hXSaYXb3VvaI5qvaCeF2MTro5YlxLddLZvx7KmlQKa1UsKQAs4vSakSjVIkKKpoTE8lvyIjW3M/jtpH2okCLWlHHqUph570Lj0Ezc1sSC+sORs26cdl5Od76qdsD9KNO4X6lJ7XtSwwrSPFnOCx1vdBbQ/7BOs9g2j/xJieaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehSw/7mS8kCE6T3cqiIf/mwbMKbdGHM6faAQ+L7nf/Q=;
 b=fM7JERa9s1jOcvxsdoVLuLE+PHtAxJ1Zs8gOeSH61tvSj0SxEmNli8xmi7JDp3HTWADA4fVK0PSWHGFa2CGyDp3mk90JsCmNgPjRS5GpVuUd0jgpSfbk9NYU4YpTHOC3L6SRaqaC7GbUrsR/5a/K5BFSniM1L1f3j7oLpKNJT6KgNdQ7//WrCBKGl79xGDKvTV7bB3r6+u+c1O1PoyTWCgoIITrZ/ADuQpouiLdE01PkFFeXEcIeo6zrCGHgRV7+NNxdX9A4zW/WtrnsKxKcZHai9fUELDp8VWi2R7yAGKg/WuNKI9ZJgrXRcUPVSAE6BC4dR3I3tg+fDiE+DmgZkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18)
 by DS0PR11MB6517.namprd11.prod.outlook.com (2603:10b6:8:d3::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Fri, 23 May 2025 12:23:28 +0000
Received: from SJ0PR11MB6696.namprd11.prod.outlook.com
 ([fe80::c25a:5de1:4bf0:4d8d]) by SJ0PR11MB6696.namprd11.prod.outlook.com
 ([fe80::c25a:5de1:4bf0:4d8d%5]) with mapi id 15.20.8722.027; Fri, 23 May 2025
 12:23:28 +0000
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Chegondi, Harish" <harish.chegondi@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>, Adam Miszczak <adam.miszczak@linux.intel.com>,
 "Laguna, Lukasz" <lukasz.laguna@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_eu_stall: Skip test on SR-IOV VF
Thread-Topic: [PATCH i-g-t] tests/intel/xe_eu_stall: Skip test on SR-IOV VF
Thread-Index: AQHbyz+Jl9CLcauwGkyMvEjXBJkZBLPgB7MAgAAa8yA=
Date: Fri, 23 May 2025 12:23:28 +0000
Message-ID: <SJ0PR11MB6696245EB0A05F188D95AF06AC98A@SJ0PR11MB6696.namprd11.prod.outlook.com>
References: <20250522172441.3914198-1-jakub1.kolakowski@intel.com>
 <9eb53198-a170-4cb2-9f31-db5f3dbeb60d@linux.intel.com>
In-Reply-To: <9eb53198-a170-4cb2-9f31-db5f3dbeb60d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6696:EE_|DS0PR11MB6517:EE_
x-ms-office365-filtering-correlation-id: c6eff320-a1d0-4121-fd0e-08dd99f49fb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?d05sZ0ZITmpqRDZsRHN1d0ZPbFdTcktVQ2NiSlUyQmtQTzBxL1dubzNyckFM?=
 =?utf-8?B?SGphaHEvRllkc1lycUFWY0wzNEJNdWtPRVZBeXREUTlCKzAyRWVjb3JzS2JH?=
 =?utf-8?B?QmJpZVNiOXVGS1JDR3czMHZBZXVXdDJKcUVJSzgrYjF2RDhEdjNTdDZEbEIy?=
 =?utf-8?B?YmpSaWVadjZzYTZqdkF5cFhQQjdRRFRXdG9Sbm9oSm1OWEdxdWxvOTUxcEhs?=
 =?utf-8?B?SkErUDdYSGxreWVnOXVQbUdPVm9pbU9XWlp5cTBGQ09rclRFZ3ZvRVY1bzh3?=
 =?utf-8?B?QU81VUpjYlZEdGIzTVdtMFdMbkkxWXRTR2h5UjYyR1pTV0ljMHFEeE1VclZG?=
 =?utf-8?B?d0hHM3ZCSkZRVk5NVWV1bzVQK3NubU9uanpxajRqclk0amlaMlpzN0UyNUh3?=
 =?utf-8?B?aDVqSVRZNGwzdHRjUmlZQTI1K1FyY3hiT1dKMHp4MlphSFFpNjVzSnU3MUtW?=
 =?utf-8?B?d2VJZUk1ZDlkb1FWRzlRTlN1RUQwR01VcGhnNDl0amVlVExkOU5DQVJva1BI?=
 =?utf-8?B?cjNuU3A5VHpNYmRXMnFMclhmN3JtY0h3ZTNEcDlEWDI5TEhudEdtTFRUL0pW?=
 =?utf-8?B?MktmOXU2MHU0VzlWVU9pd1V0L21zR2tUUmF2RUVYM3R1ck9qM1NhVm5VaTVV?=
 =?utf-8?B?ZVgxTWlZNzV2NmRuaVBSRHpOdE1Wa0FKRWIrSWpYa1dKSUFiVldxdy9FdVpx?=
 =?utf-8?B?SjlMZDR6NDEzRUFPc0ttc09hQVBiQ053TXhQZmJ3MVU5c2RJZTVBNUoyelN6?=
 =?utf-8?B?bDAxZGwxV2FGUFAzUVhwaVhjMitPNFQvM1I3ZmRpWGxqQmtBam0yQjJabkQz?=
 =?utf-8?B?a3VpNEJOcFBlQ2JtVkNhbk8zbW4vU1p4ckdBaTdtY1pGS1NTNkp3Vm1pWjZF?=
 =?utf-8?B?Wk9jcVVZZW5admZlYms3YUU0RVAxa3VkcWNMeTljRDFzU04zZU44NnV3T0xU?=
 =?utf-8?B?bXV0K2hxNUpuRlY2N1Rlb0cyZzhLck1LMkgrdUxCbmh1clFrdmtMazNIREZL?=
 =?utf-8?B?SVVGc0FsM0o0Vk05L2xpeDhhY013Nk1uQTUySGhYdG83VElNc0Y0WVZ5RktV?=
 =?utf-8?B?cUpMQy9CekpMZmgwTXZMai9HWDJlay9pd0RxMTh6NFo1Q1o2T3JBRGxZWlY3?=
 =?utf-8?B?OXVCZ3F1WEFKVlNEaVkvVndSZkl5VlVqeGMwdnI2ZW1IZ2owK2JpM04zWU9O?=
 =?utf-8?B?cm5mQ1R4eDRSUDhobUVOVC96b1pDT2pNNHFjak5pNmRTVDlHL2w5OFpvSlFO?=
 =?utf-8?B?b1VzNWk1bFZ6K3dxSDNPU2JCanBJdzgyWlA0NENRYytNNWNGaHY5OHppZFRw?=
 =?utf-8?B?dVhBRzZiR2Mybk5lZ1l4clNkTktWNFJ1NktjTFZ3RnZzQm9MWU1JajBqcXlo?=
 =?utf-8?B?cEJiellMT0p4SE83K1JHNko1L200SGZBeVdZd1owWXE1bkl0Z3lISFVDMEhv?=
 =?utf-8?B?Vmd0OUdBWUJXSjdodTNJZEZ0T3h3ZXloU2x3bDdwSlBuS1BRSXBCYzlNY0pE?=
 =?utf-8?B?a2M1TTErRUFjencvNjFvdWx1bW5ZTFhYdVNsSXlWOUVGUnZMTG9VVUR2a1Fy?=
 =?utf-8?B?Z0ZKNzBRTjhuWGVxR3pPNTNaaXBoVWFCeEVpMVcvbUNoWTdORWVIZTlTdzl1?=
 =?utf-8?B?UDh0YUJibVNOczFHUTRWNWxmaEJXQ1U3K1hVYjFPQVA3ZmNVakdHcHJROVFI?=
 =?utf-8?B?d0dvMm4yVWFjTTNyOUhvT25Ca3BuYmVBbDNIWCtFU1N6WnhhTVc2Tm9TRE8x?=
 =?utf-8?B?Wi8wc3NNTHpERWdoYTQzTHdTSlNNQk9QY1VyQlU5aFBwdXcyaUNNV2F3aUZ1?=
 =?utf-8?B?RzNLdldDMXJFVk1GSHkvelVJRDVhdDZseTFrcWg4aC9mZWRYN3BDYWRkZkVJ?=
 =?utf-8?B?UU9kdXJPeWpKeVd1WVFNVm41UmxTajJDMWJxWDNIM3VyUUI1RG9nV21XVytL?=
 =?utf-8?Q?nkl1Vv5UX2k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6696.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VC9TY29UckZNUjg2WExBY296bGRTcUpsb3Q2NUpOamxYS3BEOGw5MG9RTzdq?=
 =?utf-8?B?VWRCZmdSMllENmpIQ2dnNTZPZzVBR0twQitXWFUwSURQbm83c2dMd09EKzZX?=
 =?utf-8?B?L2pHMVJrT2JQazJBL25UWExtbmlYSnl6a28wUE1Cc0NHTXpEYmFpS2VHbzNL?=
 =?utf-8?B?bmRqSHpJSHlnc0licWtOR2Q5aHVXUk1WUlZvdFRLQjlsRE1xTWFOQUtBUzVP?=
 =?utf-8?B?SFVxaSt5eFFMT3BZUkpIRWJvY2QvcVBIT0dsb1JFMHM4ZkNEdi9JWm9ZZmlH?=
 =?utf-8?B?cWk1dnZSVU10UmdxSUlZN0czUzlUSmMrbkxqcWRXcDJFWXY4ZzVtTTU5ZFhj?=
 =?utf-8?B?R1Q0QThYNzRtaWEzUFczdnFrVjE0d2R3S0JGUStKd1lRNWtJRGRJdDBWU1B3?=
 =?utf-8?B?TzE4a3JOeGZ1bWFFSHlUNEpEcHFROW4weXBlR1JrUEtTWnBWN0Rlb2ZFVkIz?=
 =?utf-8?B?R0V2VFV6OWZvWEVvV1NsYmM5SG1DbWtpNFBvZzZUUWF5UDM5YlpGRDFGUHhl?=
 =?utf-8?B?L3l4eVZ5QkFHWTZOR2d5N2srR3pvckc3RGFOUEloKzE3ZEt1dTlLY3V0WC80?=
 =?utf-8?B?UDZ1MkFXU2F6MUc4TGtlbFNneHZsY0ttZUNod0pxT2ZYVE05Z3VBSjZhSXhB?=
 =?utf-8?B?ZngzTDh1ajJHaS90eUloc1hBaUF5bWZjSFF3U290U1JndGZONGZmV0NacWpn?=
 =?utf-8?B?ZkFyekVGRTdNZUp6d1pYdnk5OU5pSG5mSFhmVjhVVEVUUW9CSENQaVBnYTli?=
 =?utf-8?B?dmRyZ3gvWWFudVg5ZmxvU2hUMjZNTWk2SHhqOStKT0hwUlB6K2FWUXFEUjRM?=
 =?utf-8?B?cVZsVWNUaVVkRXdNQjljTzFmMitoRWdmQk9lMjZPYlpHVWF4UGZpQnJMZTNw?=
 =?utf-8?B?R20xb3duOHJrWWd6S1BoL25ERjZtcER5OHdvRnErV3dVbnZSWDRJTGpvZ2Zs?=
 =?utf-8?B?SVFVb21LUTNrZkRZbnpQcERTcnN5WnBmTENiZVI4NDRDcC9tck5aNmpiTjhu?=
 =?utf-8?B?MEVkajBsTWs5Y29xemp4a05uYUVNK2dTbnVjM1VSUCtGb01BOVl3Q2pOb01k?=
 =?utf-8?B?bWRsWDRheHY0bS9WRzdQS1JwYXA5YkJKZ3llTEVxT3lFT0VyZzUwWnFxendN?=
 =?utf-8?B?dllrZkUrMDBEaUd1N1VrM0RBQTdHY25VSlFPdkQ5WXVkMUYxSUFEVkk4OWs4?=
 =?utf-8?B?YnZuellvS3FkZTlSSlJDa0RWR1FoeTVSTjBXMmNqbm9xTGtyM2R5ZmZ1NmJp?=
 =?utf-8?B?M2RyWHBXNVlndzY3T1JZem1VQUxRcjRTNEswNW9EQ2w2OEpicjBqNHA5R05U?=
 =?utf-8?B?Lzc4TUtRWkdlclVteXI2bmlsTTc5YlAwZE50UmdqU2dhUkxFNGZNelR5cm8x?=
 =?utf-8?B?L0EvSm4vd0Vab1o5QUdSV1g2aU5kYms3MFVBV09kUXhpMEZHQzRKaCtCUVA5?=
 =?utf-8?B?MEVGcXAwb2trdkhDYWNXN3dXNTh2Q1Rwck5UTmIvTlRaV1UxV1Z2c0V2dkJE?=
 =?utf-8?B?MzJiSThCNjRVSzR0azdzZ0plUGRwamE3eGs4ZG5hZGwxeCtDUmEzWHo0UzBU?=
 =?utf-8?B?UmQ4YytjaFN4NmJxZ25Qem9YY1Rsb2tVUFpwcmZ2UDZUMGNKSGVqUGtKMXdp?=
 =?utf-8?B?MUtQVmFndTh4eDJ5c0oyTmMwVEJjRHZ4NXcwSHNmT05iVkZMYkVrdHRjaG9Y?=
 =?utf-8?B?LzFwOHE4c2xCeU9KN0NuS1dXcU5nZnU4NEEzTjVUNVllN2dPcS9XWmZiK1Bu?=
 =?utf-8?B?ajNTZSt2azFpTlFsQ2Y5anpxd3BBRWFhUXdxMEgwOWxUQTFGZytZWk5IZzZq?=
 =?utf-8?B?d2xEelN3R0xmZWdaeGhLYUFKVmt2UVBHbjdvMGh4TFZQcDIxaU1wdVY5cmVo?=
 =?utf-8?B?a2JjZTVpM29OWUI3QXJ2TGZOclBIRkZ1Y1NSR2tNdWNUWnFaOHF0VTRjQ0ds?=
 =?utf-8?B?dExBaXVOakRaUG9TMXl6RXBiVlM2VC9DS3RXdEJxRWZXd1d4NWYzOVJ1WEpY?=
 =?utf-8?B?bVEwZGNlZFZnYThGZldsczlWMTVrNnNWNjJ4bkpad0d0UUtoUVVyalhwZTg2?=
 =?utf-8?B?WXJqaGpBdnNBTENIVi9Ca2hJRUU2Vm9tL3BsQmRGS3FHM0Mxak1JUVRUdHpz?=
 =?utf-8?Q?Jooxyxot6EIxjpMJ4HzFFLO9p?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6696.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6eff320-a1d0-4121-fd0e-08dd99f49fb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2025 12:23:28.6354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q0+RT+QcrQpaJLkG27h1qe/jHGYRJ1yZWWcATnw1rjpaFVEmHBlzOH8fJ4vBshRybLEGlsGjl1SGNgQUi9F/jSs9k/z0e1QVCdQFIiybo5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6517
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

SGkgTWFyY2luLA0KSSB3YXMgdHJ5aW5nIHRvIGFsaWduIHRoZSBjb2RlIG9mIHRoZSBJR1QgdGVz
dCB3aXRoIGtlcm5lbCBjb2RlLCB3aGVyZSB3ZSBoYXZlIGFuIGV4cGxpY2l0IGNoZWNrIGZvciBT
Ui1JT1YgVkYuDQpTZWUgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS90aXAvLS9j
b21taXQvMWQ2MjJhNGZlMmI5YTMwY2Q0YWYyZTg1OGQ3OTNkMDVmOGE4Mjc3NA0KDQpKYWt1Yg0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQmVybmF0b3dpY3osIE1hcmNpbiA8
bWFyY2luLmJlcm5hdG93aWN6QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBGcmlkYXksIE1heSAy
MywgMjAyNSAxMjo0MCBQTQ0KVG86IEtvbGFrb3dza2ksIEpha3ViMSA8amFrdWIxLmtvbGFrb3dz
a2lAaW50ZWwuY29tPjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBDaGVnb25k
aSwgSGFyaXNoIDxoYXJpc2guY2hlZ29uZGlAaW50ZWwuY29tPjsgRGl4aXQsIEFzaHV0b3NoIDxh
c2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+OyBBZGFtIE1pc3pjemFrIDxhZGFtLm1pc3pjemFrQGxp
bnV4LmludGVsLmNvbT47IExhZ3VuYSwgTHVrYXN6IDxsdWthc3oubGFndW5hQGludGVsLmNvbT4N
ClN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXRdIHRlc3RzL2ludGVsL3hlX2V1X3N0YWxsOiBTa2lw
IHRlc3Qgb24gU1ItSU9WIFZGDQoNCg0KDQpPbiA1LzIyLzIwMjUgNzoyNCBQTSwgSmFrdWIgS29s
YWtvd3NraSB3cm90ZToNCj4gRVUgc3RhbGwgc2FtcGxpbmcgaXMgbm90IHN1cHBvcnRlZCBvbiBT
Ui1JT1YgVkYuIFNraXAgdGhlIHRlc3Qgb24gDQo+IFNSLUlPViBWRi4NCj4gDQo+IENjOiBIYXJp
c2ggQ2hlZ29uZGkgPGhhcmlzaC5jaGVnb25kaUBpbnRlbC5jb20+DQo+IENjOiBBc2h1dG9zaCBE
aXhpdCA8YXNodXRvc2guZGl4aXRAaW50ZWwuY29tPg0KPiBDYzogQWRhbSBNaXN6Y3phayA8YWRh
bS5taXN6Y3pha0BsaW51eC5pbnRlbC5jb20+DQo+IENjOiBMdWthc3ogTGFndW5hIDxsdWthc3ou
bGFndW5hQGludGVsLmNvbT4NCj4gQ2M6IE1hcmNpbiBCZXJuYXRvd2ljeiA8bWFyY2luLmJlcm5h
dG93aWN6QGxpbnV4LmludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFrdWIgS29sYWtvd3Nr
aSA8amFrdWIxLmtvbGFrb3dza2lAaW50ZWwuY29tPg0KPiAtLS0NCj4gICB0ZXN0cy9pbnRlbC94
ZV9ldV9zdGFsbC5jIHwgMyArKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXVfc3Rh
bGwuYyBiL3Rlc3RzL2ludGVsL3hlX2V1X3N0YWxsLmMgDQo+IGluZGV4IDQxMWMzMDg3MS4uYWE5
NGQ5NTY1IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9ldV9zdGFsbC5jDQo+ICsrKyBi
L3Rlc3RzL2ludGVsL3hlX2V1X3N0YWxsLmMNCj4gQEAgLTQ0LDYgKzQ0LDcgQEANCj4gICANCj4g
ICAjaW5jbHVkZSAiaWd0LmgiDQo+ICAgI2luY2x1ZGUgImlndF9jb3JlLmgiDQo+ICsjaW5jbHVk
ZSAiaWd0X3NyaW92X2RldmljZS5oIg0KPiAgICNpbmNsdWRlICJ4ZV9kcm0uaCINCj4gICAjaW5j
bHVkZSAieGUveGVfaW9jdGwuaCINCj4gICANCj4gQEAgLTY1Myw3ICs2NTQsNyBAQCBpZ3RfbWFp
bl9hcmdzKCJlOmc6bzpyOnU6dzoiLCBsb25nX29wdGlvbnMsIGhlbHBfc3RyLCBvcHRfaGFuZGxl
ciwgTlVMTCkNCj4gICAJCWRybV9mZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfWEUpOw0KPiAg
IAkJaWd0X3JlcXVpcmVfZmQoZHJtX2ZkKTsNCj4gICAJCWRldmlkID0gaW50ZWxfZ2V0X2RybV9k
ZXZpZChkcm1fZmQpOw0KPiAtCQlpZ3RfcmVxdWlyZShJU19QT05URVZFQ0NISU8oZGV2aWQpIHx8
IGludGVsX2dyYXBoaWNzX3ZlcihkZXZpZCkgPj0gSVBfVkVSKDIwLCAwKSk7DQo+ICsJCWlndF9y
ZXF1aXJlKCFpbnRlbF9pc192Zl9kZXZpY2UoZHJtX2ZkKSAmJiAoSVNfUE9OVEVWRUNDSElPKGRl
dmlkKSANCj4gK3x8IGludGVsX2dyYXBoaWNzX3ZlcihkZXZpZCkgPj0gSVBfVkVSKDIwLCAwKSkp
Ow0KPiAgIAkJaWd0X3JlcXVpcmVfZihpZ3RfZ2V0X2dwZ3B1X2ZpbGxmdW5jKGRldmlkKSwgIm5v
IGdwZ3B1LWZpbGwgZnVuY3Rpb25cbiIpOw0KPiAgIAkJaWd0X3JlcXVpcmVfZighc3RhdChPQlNF
UlZBVElPTl9QQVJBTk9JRCwgJnNiKSwgIm5vIG9ic2VydmF0aW9uX3BhcmFub2lkIGZpbGVcbiIp
Ow0KPiAgIAkJaWYgKG91dHB1dF9maWxlKSB7DQoNCkRvbid0IHdlIGhhdmUgYW5vdGhlciBvcHRp
b24gdG8gY2hlY2sgdGhlIGZlYXR1cmUgaXMgdW5hdmFpbGFibGUgKGV4LiBhbiBpb2N0bCByZXR1
cm5pbmcgRU5PREVWKSA/DQoNCg==
