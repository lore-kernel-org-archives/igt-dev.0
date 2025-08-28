Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9C3CA0EED
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 16:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C7310EA48;
	Thu, 28 Aug 2025 16:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDHmm/lh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F5210EA48
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 16:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756398762; x=1787934762;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mRM7JcW0hi1cSDfJIkISWpJdp5zVw9zylCBCzvN4zIE=;
 b=RDHmm/lhqtDnA2aH4yiw+ttTQj7EhgCnc2HljOCS4MfY7yVwOv75wRZd
 6ZaycbfaVcQJImOf4Deg/nFkWFmeLEVB/K7IUrzByn1EJj+GBANSJznQt
 q4lk0laJFHXQX+cIuMz3SWFeFWd4JrBuCmPlXf/qLoqeQCd5Q7pbWVyn1
 DCk7UK24EynuDG1FkOYGJ7Pq3WvNoIealCHSpv5qZ0F7wHV+Qo6BuB5rC
 ymEtHOt8k3u14vjMGoQAKVEVZiYgL9olR+I86r+rdq64AbJJnNvPB1iEr
 kZCgsC+suiBJOBdmdcQgwKaqZjgwJsFlAnrofxdEFxkzqnlUR541T7MSw w==;
X-CSE-ConnectionGUID: U3XZ7NbWTL2Lw1sQvl1htA==
X-CSE-MsgGUID: BShb/aqkSpaPFUog1Ui9MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58528549"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="58528549"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 09:32:40 -0700
X-CSE-ConnectionGUID: buWN596zT+OjrJo33BBwAg==
X-CSE-MsgGUID: dfVNSJ3/QGuApJoGx98PhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="201107435"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 09:32:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 09:32:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 09:32:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.86)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 09:32:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6/Ah7atW/jnrKl5bBxHEh7eeYaqqJCztrABxxU+oJ22/oygZGHSGZPCzNoYDbPHDU2lM0/8UvdQR6imFEgdkREhSv6sTrOhZnD5cLS8MtMUTuo7QaBjHfGETFmjju+wXoN+k0fNukXR9grsVD9nwBXxWcJK62XQSTSBApygNh6dQdQHsGQ9M+QQ255k0N9IohuxSUCglAbghklgLKEfuuDxfDmMd6zSzDk4ec7UK+e7QyyrE3/JFazCLFmJzIfVF0U2vZsXqhLX1sFfDahZk3qevCjBNVT91y99Jg1j3S7Nu2iXlxgnPbKQ2AXOmuWTZ3xLhPBeBYEKewAlZRCqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQLmdiVAHRdkX6UP04sm4al8uAHgATq80HVl4PyIL5E=;
 b=vTMCgWGKyp5vnhZgrMxzHU0Sq0TQx8u4sDRiV7eyMUeaTOVxm9edo+mduiDk5vjQW3zGrFPwXv2dAMZcjIGgO2Ev8US084IfTvfAIxM7RJ1aEYkSWpH0Vnq9EqXmwR7iIKW0N+xfHP+QY77J9QmUWwCuqfcPf2mmtB36HOfSQ+Yh06sWLMJrza82dIhrX/6TUm/Ru+m0a8wbfcluSpXQazXT3knWbAraFRTJ5b5OtiHDxIur4LK5RNqdbNG/YsmFQUcpDEr6kdl0l46owsHmH6AAZH8K56xDQQw0r50Be8e9FUGXbhChv3qVDy50U2fSW2+BBy7/eVW3digYRDVEIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by DS7PR11MB8825.namprd11.prod.outlook.com (2603:10b6:8:255::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 16:32:35 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%6]) with mapi id 15.20.9052.023; Thu, 28 Aug 2025
 16:32:34 +0000
From: "Sharma, Nishit" <nishit.sharma@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "Siddiqui, Ayaz A" <ayaz.siddiqui@intel.com>
Subject: RE: [PATCH i-g-t 4/5] tests/intel/xe_exec_system_allocator: Added
 preferred_loc_smem test
Thread-Topic: [PATCH i-g-t 4/5] tests/intel/xe_exec_system_allocator: Added
 preferred_loc_smem test
Thread-Index: AQHcFmVMRX01Fv5cSUa+66F2wxvaAbR4LIeAgAAZCTA=
Date: Thu, 28 Aug 2025 16:32:34 +0000
Message-ID: <MW4PR11MB71517AF33E3DB63ABBF2B372E43BA@MW4PR11MB7151.namprd11.prod.outlook.com>
References: <20250826084133.897768-1-nishit.sharma@intel.com>
 <20250826084133.897768-5-nishit.sharma@intel.com>
 <BL1PR11MB552550F84F2C430E92C2A254843BA@BL1PR11MB5525.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB552550F84F2C430E92C2A254843BA@BL1PR11MB5525.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7151:EE_|DS7PR11MB8825:EE_
x-ms-office365-filtering-correlation-id: 9e028bf3-0bf4-4e1e-3a50-08dde6507e50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ZKaIXPPstE6rx5z/NsDj9Mfrzy8omZzNerDunhbvxypaN+aHrXvMAwo7Gf0Y?=
 =?us-ascii?Q?1vO4KztK0HHvQ41mCNAiajzW8NMmH1lf+TXHh1xckvzNbHV5aj8jFVrEupYl?=
 =?us-ascii?Q?1vGiwPld6zqcwQgzpG9jcwtKElRJ6aug7HRrUps2YL6oYjee+Z6nA1b2ytx5?=
 =?us-ascii?Q?YDTiBDMRaFV6bbY2lbag9KahJknEhyso+QIoYKkqYjV808P44aNZpNTG2vfq?=
 =?us-ascii?Q?wzme0eRq3dq4YxCaZPljRb/BeezlzoexqniM+FSybLQCHYR+dBI24mshprV6?=
 =?us-ascii?Q?VQ3/CSGHcA5AQHHNntD2fEXsD88ll/4OjEM7c+g3R302dSUrYcXGt9AOMqz0?=
 =?us-ascii?Q?NoAmRX74+XJ4Lm/ykY6jGo/uTEJig4N2uFW0i+8nSXXFArOcOuyAocRXRZ6h?=
 =?us-ascii?Q?VawaD/BGK880Hz+eMo+alvQw/9913ywYGdkpULNLGG9vvKB6FDNJqFFzG/on?=
 =?us-ascii?Q?VsXmzi9o9GsUCSKtR/KOdOL9hf2/T63I3TJPcQ+rLFWwoUSHqrLmiOaLoJeR?=
 =?us-ascii?Q?d2ZC3DOlYZIYKcll769xCJ3nGomq3wBy0mUdLgNlpsI/kBsy6TjiHt8ChsP5?=
 =?us-ascii?Q?raVfei9CmT67Sfxk1zDGP7RrGr3hlKVk8gzXJ7Yeg7UnqTj6RiqMWx9eNFMW?=
 =?us-ascii?Q?FidvLLZDSttW6yDJF9QflUQ5Ug+vvjpU4srej2vjqZDN/olZH9Gj2vxjz0As?=
 =?us-ascii?Q?YIbCdRywuuaeAHZZCiRebkyGoyeeudIVv7FfpoHGbr8FMxJ3o+0OINusfg6+?=
 =?us-ascii?Q?1fhL0y3C8njyL38m8bnAkgDanU52miTAOaJ4OsMRq/jXjUqpHw63SZ/7cRWS?=
 =?us-ascii?Q?cL2Hd9u34RbKfpMENZXaiRqobPGba4rN5QiYxPSi/lbzRdfsZBfIZSyw1044?=
 =?us-ascii?Q?9xpMIMsBEiwU6IS3dpCgYoR++QZ6vitNzSEu6fujK4qnBGMlNu5IHzbzNf1d?=
 =?us-ascii?Q?jW6lUwcVP4WzphK669xXeM9tbM9nLroPTGlCWIZXXNHWYWE/cFno1WaQ+5k7?=
 =?us-ascii?Q?mtx6+20EuUTgwNrn7Gy+R13uPTa3kuwmJDc5oKcW+IeoiA5AodMis/M7LEYM?=
 =?us-ascii?Q?i6axCaWUeuOJdesRweyRips+dcVXUeT1cMX8Wqzge1LfStp6AiBydpXEmgD6?=
 =?us-ascii?Q?O/8XMJ4Axz0TBNPhM/ZTegzGwx3KE8IXHoVfNGvbF6SkDOATb/e50oKX67M9?=
 =?us-ascii?Q?XHwim5pxuyuqm9ZgdmMwIIZgX4c7lljPR2K9opmKYXbedsOTf/odYYWXxdro?=
 =?us-ascii?Q?oipwSC6t89C6atZGCa+Vcw5d5ZH5glOwDg1FKsCh5PW6KhioIej+I3VQkSfS?=
 =?us-ascii?Q?pAR/KOq/RpwelOlNnH2ki7vDkDRQ02cWdxtpRHwdBgaHvpKgqkSEz5/Uz34W?=
 =?us-ascii?Q?LKBv3bwcZ4djVhD5i5MuCl9HuCprt3jxTnn9Lbqi9PFNRNg9zgstJFyenjvL?=
 =?us-ascii?Q?PweGGvLDKd3jHoZcddTh6+Z0N6TP5hbDQqyxQPArLDKl/ZuMU01l/A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v5l3YzoimxM0MEeJ3hJVzjX3Eryn14Dd/Td5IRL97495iZh2X18LxPxaQLxN?=
 =?us-ascii?Q?3TvuEunpahzVKDOkM+CQxEJQpty+6ElZ02GKnmHhpliCj4jRI43CV0AUdXkp?=
 =?us-ascii?Q?qU+fX9A8z9o6z5tMR2L8eSuWG/dt+CtsjzWPc1NlAQHQfhrTgtTcHhpEfGau?=
 =?us-ascii?Q?nwMkUhK04o9ePGJyiBFjIfvDN+QxOWFdemY3s19DIwRM4Pfx/NLzs9XBAbel?=
 =?us-ascii?Q?JmcwWsQliezuDaXiDFtJNawlAE9uDeAnqxvFh/9Q8DIUnBkUzqPzsNkUf4Nw?=
 =?us-ascii?Q?//S6cFFb9tfMEW4IJY0rpBy9itupWeoVsSPfGiL5pvBD5m0DTQvLtXNulZ0t?=
 =?us-ascii?Q?daVGeMfWbs7GOUOTUFNi0vZ1x/emiDRvhvsH3NZdc5yF+CcLn14Q1Vlc538w?=
 =?us-ascii?Q?IRj4nuTXNDRyOXnQwIRcpriFuMWx8rx3+Ayl4Cs/ex0lQWTRpst7kkcdZ6zY?=
 =?us-ascii?Q?AOAyRFQOh9XU5aZpDiXGOhGm9tfMJxoI7cQVytXD78BIhECF/vu8845XvVKu?=
 =?us-ascii?Q?t3ysW2nlOQ4RFOrd+Fq3iFAcSSrxoitysGfgqsKR738Q6UcgAzP/OzC81UvZ?=
 =?us-ascii?Q?jxcvZ6zz8fbj+iAiP9A/xnKjNQmD9SQc1EUU0BCKw8mlf+nwHm3nRQf3dkw3?=
 =?us-ascii?Q?YTB28RTdvyTTQSH1IHVEsrynfcS4rhNL4VZdV9lTx/ifZ2TEaDBWr8GwC3/7?=
 =?us-ascii?Q?MSeD8yjhjtToEWPgROdC5l5SV3BSmPW/2RrmJkzM3hqEfobvsauhHsFQzF8G?=
 =?us-ascii?Q?XKN+sfdVbzzLlsI0917+yJYX8CgsFFsTnf50od2aED/B5xrsC8eDc5h316qa?=
 =?us-ascii?Q?3R3S2aZdItV9HKXy1Mku83l4z2FKvRxlmFxh+OUTn+aKjiOZLhJcAP+x4cUe?=
 =?us-ascii?Q?fQ1F1/tbYYT0Qy5n/wudVA/jxMPHGhBm6uXEjJdUMIFZ3bGsJpCWGN/tqwr8?=
 =?us-ascii?Q?moCEH3ryL/48WNWa8jAi1FVzOi+W/cgg10XYYIloqdrD0MmSFC6bP6H+eKJx?=
 =?us-ascii?Q?2Zb6hr465VPH1n9P9oINlCp89VXWQGqn6l72YaWlpyDCWHHYNQENk0hl5Kq0?=
 =?us-ascii?Q?ttCIt/0t9OFzhB9Kfk9HPWvJBAGm6NIa7w9FAdeJcW3PbHLWQkjpoRT+XvMI?=
 =?us-ascii?Q?vsDg7L5lzgEZiFAiweEvchLDLEPQq2Zda1WxRdBCANxkhA2nwWL1hvM/QJ7O?=
 =?us-ascii?Q?RIlD+iXqKUeeaQmx7iSe8h2Hmu8P7+B03g+qrw2Xn+J/HvNKwO9pryyWD4Mk?=
 =?us-ascii?Q?V6F5c3zjPPghj4f6MoGyPbPYTN+0IpZdGIVl8HXGm/MuFovXNyjUXOhmpF9D?=
 =?us-ascii?Q?4JE2CxPuph1BVAlImAYpeuzlN1jNQoTLEByTRZqkL5jg6MupLBq0TAtWtBLb?=
 =?us-ascii?Q?fVV4pGEyM6HKCtWR7p5Uxmr8Roo0T2CTiZLqHQxEe8OMFH/XgIBJZDqzepUl?=
 =?us-ascii?Q?KpeGF6xnkgUFo6NW0ajm19rX4BLDt3JkhsvGOIEZsntc98vkX2Y+SBhLhiAF?=
 =?us-ascii?Q?i1FndoKFKBBI2TmANpgRyZQ82+Ktgxbi4b+WzAs1Ugpygbk8h2peDDeeFqjY?=
 =?us-ascii?Q?iuegJNNx1lG1+yGDriXjQnYp0cJDObG0GM2ltpyU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e028bf3-0bf4-4e1e-3a50-08dde6507e50
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 16:32:34.7179 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MMWzENYQu+6+ixadGzM19B0Oj3KHk3B7vOfzF0Oeam90jfWrOYw4uc3GVKjtfeAFWwBdKDq3vwBJRFw/eP8N6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8825
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
From: Gurram, Pravalika <pravalika.gurram@intel.com>=20
Sent: Thursday, August 28, 2025 8:32 PM
To: Sharma, Nishit <nishit.sharma@intel.com>; igt-dev@lists.freedesktop.org=
; Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost, Matthew =
<matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
Cc: Siddiqui, Ayaz A <ayaz.siddiqui@intel.com>
Subject: RE: [PATCH i-g-t 4/5] tests/intel/xe_exec_system_allocator: Added =
preferred_loc_smem test



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of=20
> nishit.sharma@intel.com
> Sent: Tuesday, August 26, 2025 2:12 PM
> To: igt-dev@lists.freedesktop.org; Ghimiray, Himal Prasad=20
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew=20
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t 4/5] tests/intel/xe_exec_system_allocator: Added=20
> preferred_loc_smem test
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> Added preferred-loc-smem test which is called in combination with=20
> other tests as well. In this test the buffer object preferred location=20
> is system memory. MADVISE ioctl is called with preferred_loc attribute=20
> and default_system system memory as preferred location.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 225=20
> ++++++++++++++++++++-----
>  1 file changed, 187 insertions(+), 38 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_system_allocator.c
> b/tests/intel/xe_exec_system_allocator.c
> index 007d9bdc0..70ca5fc2e 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -138,7 +138,6 @@ static void signal_pdata(struct process_data *pdata)
>  #define CPU_FAULT_THREADS	(0x1 << 2)
>  #define CPU_FAULT_PROCESS	(0x1 << 3)
>  #define CPU_FAULT_SAME_PAGE	(0x1 << 4)
> -
>  static void process_check(void *ptr, uint64_t alloc_size, uint64_t strid=
e,
>  			  unsigned int flags)
>  {
> @@ -406,6 +405,39 @@ static void __aligned_partial_free(struct=20
> aligned_alloc_type  *aligned_alloc_typ
>  		       aligned_alloc_type->__size - aligned_alloc_type->size -=20
> begin_size);  }
>=20
> +#define MAX_N_EXEC_QUEUES       16
> +
Is there any need to move MAX_N_EXEC_QUEUES   to start
Replied in [PATCH i-g-t 5/5]

> +#define MMAP                    (0x1 << 0)
> +#define NEW                     (0x1 << 1)
> +#define BO_UNMAP                (0x1 << 2)
> +#define FREE                    (0x1 << 3)
> +#define BUSY                    (0x1 << 4)
> +#define BO_MAP                  (0x1 << 5)
> +#define RACE                    (0x1 << 6)
> +#define SKIP_MEMSET             (0x1 << 7)
> +#define FAULT                   (0x1 << 8)
> +#define FILE_BACKED             (0x1 << 9)
> +#define LOCK                    (0x1 << 10)
> +#define MMAP_SHARED             (0x1 << 11)
> +#define HUGE_PAGE               (0x1 << 12)
> +#define SHARED_ALLOC            (0x1 << 13)
> +#define FORK_READ               (0x1 << 14)
> +#define FORK_READ_AFTER         (0x1 << 15)
> +#define MREMAP                  (0x1 << 16)
> +#define DONTUNMAP               (0x1 << 17)
> +#define READ_ONLY_REMAP         (0x1 << 18)
> +#define SYNC_EXEC               (0x1 << 19)
> +#define EVERY_OTHER_CHECK       (0x1 << 20)
> +#define MULTI_FAULT             (0x1 << 21)
> +#define PREFETCH                (0x1 << 22)
> +#define THREADS                 (0x1 << 23)
> +#define PROCESSES               (0x1 << 24)
> +#define PREFETCH_BENCHMARK      (0x1 << 25)
> +#define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
> +#define PREFERRED_LOC_SMEM      (0x1 << 27)
> +
> +#define N_MULTI_FAULT           4

Is there any need to move N_MULTI_FAULT to start
Comment above.
-- Pravalika
> +
>  /**
>   * SUBTEST: unaligned-alloc
>   * Description: allocate unaligned sizes of memory @@ -460,7 +492,7=20
> @@ many_allocs(int fd, struct drm_xe_engine_class_instance *eci,
>  	uint32_t *bos =3D NULL;
>  	struct timespec tv =3D {};
>  	uint64_t submit, read, elapsed;
> -	int i;
> +	int i, err;
>=20
>  	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
>  			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0); @@ -500,6 +532,15 @@=20
> many_allocs(int fd, struct drm_xe_engine_class_instance *eci,
>  			alloc.ptr =3D aligned_alloc(SZ_2M, alloc_size);
>  			igt_assert(alloc.ptr);
>  		}
> +
> +		if (flags & PREFERRED_LOC_SMEM) {
> +			err =3D xe_vm_madvise(fd, vm,
> to_user_pointer(alloc.ptr), alloc_size, 0,
> +
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +				if (err)
> +					igt_warn("MADVISE_FAILURE err =3D
> %s, vm =3D%u data=3D%"PRIu64" alloc_size =3D%"PRIu64"\n",
> +						  strerror(errno), vm,
> to_user_pointer(alloc.ptr), alloc_size);
> +		}
I don't see test coverage for DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE  which is=
 vram
>  		allocs[i] =3D alloc;
>=20
>  		touch_all_pages(fd, exec_queue, allocs[i].ptr, alloc_size, stride,=20
> @@ -662,7 +703,7 @@ partial(int fd, struct=20
> drm_xe_engine_class_instance *eci, unsigned int flags)
>  	size_t bo_size =3D SZ_2M, unmap_offset =3D 0;
>  	uint32_t vm, exec_queue;
>  	u64 *exec_ufence =3D NULL;
> -	int i;
> +	int i, err;
>  	void *old, *new =3D NULL;
>  	struct aligned_alloc_type alloc;
>=20
> @@ -688,6 +729,15 @@ partial(int fd, struct=20
> drm_xe_engine_class_instance *eci, unsigned int flags)
>  	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
>  	data[0].vm_sync =3D 0;
>=20
> +	if (flags & PREFERRED_LOC_SMEM) {
> +		err =3D xe_vm_madvise(fd, vm, to_user_pointer(data),
> bo_size, 0,
> +
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +		if (err)
> +			igt_warn("MADVISE_FAILURE err =3D %s, vm =3D%u
> data=3D%"PRIu64" alloc_size =3D %zu\n",
> +				  strerror(errno), vm, to_user_pointer(data),
> bo_size);
> +	}
> +
>  	exec_ufence =3D mmap(NULL, SZ_4K, PROT_READ |
>  			   PROT_WRITE, MAP_SHARED |
>  			   MAP_ANONYMOUS, -1, 0);
> @@ -747,38 +797,6 @@ partial(int fd, struct=20
> drm_xe_engine_class_instance *eci, unsigned int flags)
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> -#define MAX_N_EXEC_QUEUES	16
> -
> -#define MMAP			(0x1 << 0)
> -#define NEW			(0x1 << 1)
> -#define BO_UNMAP		(0x1 << 2)
> -#define FREE			(0x1 << 3)
> -#define BUSY			(0x1 << 4)
> -#define BO_MAP			(0x1 << 5)
> -#define RACE			(0x1 << 6)
> -#define SKIP_MEMSET		(0x1 << 7)
> -#define FAULT			(0x1 << 8)
> -#define FILE_BACKED		(0x1 << 9)
> -#define LOCK			(0x1 << 10)
> -#define MMAP_SHARED		(0x1 << 11)
> -#define HUGE_PAGE		(0x1 << 12)
> -#define SHARED_ALLOC		(0x1 << 13)
> -#define FORK_READ		(0x1 << 14)
> -#define FORK_READ_AFTER		(0x1 << 15)
> -#define MREMAP			(0x1 << 16)
> -#define DONTUNMAP		(0x1 << 17)
> -#define READ_ONLY_REMAP		(0x1 << 18)
> -#define SYNC_EXEC		(0x1 << 19)
> -#define EVERY_OTHER_CHECK	(0x1 << 20)
> -#define MULTI_FAULT		(0x1 << 21)
> -#define PREFETCH		(0x1 << 22)
> -#define THREADS			(0x1 << 23)
> -#define PROCESSES		(0x1 << 24)
> -#define PREFETCH_BENCHMARK	(0x1 << 25)
> -#define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
> -
> -#define N_MULTI_FAULT		4
> -
>  /**
>   * SUBTEST: once-%s
>   * Description: Run %arg[1] system allocator test only once @@ -951,6
> +969,80 @@ partial(int fd, struct drm_xe_engine_class_instance *eci,
> unsigned int flags)
>   * @mmap-new-nomemset:			mmap a new buffer for each
> exec, skip memset of buffers
>   * @mmap-new-huge-nomemset:		mmap huge page new buffer
> for each exec, skip memset of buffers
>   * @mmap-new-race-nomemset:		mmap a new buffer for each
> exec with race between cpu and gpu access, skip memset of buffers
> + * @free-nomemset-preferred-loc-smem:	malloc and free buffer for
> each exec and perform preferred loc madvise operation
> + * @free-preferred-loc-smem:		free buffer for each exec and
> perform preferred loc madvise operation
> + * @free-race-nomemset-preferred-loc-smem:	free buffer for each
> exec with race between cpu and gpu access and perform madvise=20
> operation skipping memset
> + * @free-race-preferred-loc-smem:	free buffer for each exec with race
> between cpu and gpu access and perform madvise operation
> + * @malloc-bo-unmap-nomemset-preferred-loc-smem:	malloc single
> buffer for all execs, bind and unbind a BO to same address, skip=20
> memset and perform madvise operation
> + * @malloc-busy-nomemset-preferred-loc-smem:	malloc single buffer
> for all execs, try to unbind while buffer valid, skip memset of=20
> buffers and perform madvise operation
> + * @malloc-busy-preferred-loc-smem:	malloc single buffer for all
> execs, try to unbind while buffer valid and perform madvise operation
> + * @malloc-fork-read-after-preferred-loc-smem:	malloc single buffer
> for all execs, fork a process to read test output, perform madvise=20
> operation
> + * @malloc-fork-read-preferred-loc-smem:	malloc single buffer for all
> execs, fork a process to read test output, perform madvise operation
> + * @malloc-mlock-nomemset-preferred-loc-smem:	malloc and mlock
> single buffer for all execs, skip memset of buffers, perform madvise=20
> operation
> + * @malloc-mlock-preferred-loc-smem:	malloc and mlock single
> buffer for all execs, perform madvise operation
> + * @malloc-multi-fault-preferred-loc-smem:	malloc single buffer for all
> execs and perform madvise operation
> + * @malloc-nomemset-preferred-loc-smem:	malloc single buffer for all
> execs, skip memset of buffers and perform madvise operation
> + * @malloc-preferred-loc-smem:	malloc single buffer for all execs,
> issue a command which will trigger multiple faults, perform madvise=20
> operation
> + * @malloc-prefetch-preferred-loc-smem:	malloc single buffer for all
> execs, prefetch buffer before each exec, perform madvise operation
> + * @malloc-prefetch-race-preferred-loc-smem:	malloc single buffer
> for all execs, prefetch buffer before each exec, perform madvise=20
> operation
> + * @malloc-race-nomemset-preferred-loc-smem:	malloc single buffer
> for all execs with race between cpu and gpu access, perform madvise=20
> operation
> + * @malloc-race-preferred-loc-smem:	malloc single buffer for all
> execs with race between cpu and gpu access, perform madvise operation
> + * @free-race-nomemset-preferred-loc-smem: malloc and free buffer for
> each exec with race between cpu and gpu access, perform madvise=20
> operation
> + * @free-race-preferred-loc-smem:	malloc and free buffer for each exec
> with race between cpu and gpu access, perform madvise operation
> + * @malloc-bo-unmap-nomemset-preferred-loc-smem: malloc single
> buffer for all execs, bind and unbind a BO to same address before=20
> execs, perform madvise operation
> + * @malloc-bo-unmap-preferred-loc-smem:	malloc single buffer for all
> execs and perform madvise operation
> + * @malloc-busy-nomemset-preferred-loc-smem:	malloc single buffer
> for all execs and perform madvise operation
> + * @malloc-busy-preferred-loc-smem:	malloc single buffer for all
> execs and perform madvise
> + * @mmap-file-mlock-nomemset-preferred-loc-smem:	 mmap and
> mlock single buffer, with file backing, perform madvise
> + * @mmap-file-mlock-preferred-loc-smem:	mmap and mlock single
> buffer, with file backing, perform madvise
> + * @mmap-file-nomemset-preferred-loc-smem:	mmap single buffer,
> with file backing and perform madvise
> + * @mmap-file-preferred-loc-smem:	mmap single buffer, with file backing
> and perform madvise
> + * @mmap-free-huge-nomemset-preferred-loc-smem:	mmap huge
> page and free buffer for each exec and perform madvise
> + * @mmap-free-huge-preferred-loc-smem:	mmap huge page and free
> buffer for each exec and perform madvise
> + * @mmap-free-nomemset-preferred-loc-smem:	mmap and free
> buffer for each exec and perform madvise
> + * @mmap-free-preferred-loc-smem:	mmap and free buffer for
> each exec and perform madvise
> + * @mmap-free-race-nomemset-preferred-loc-smem:
> + * @mmap-free-race-preferred-loc-smem:
> + * @mmap-huge-nomemset-preferred-loc-smem:
> + * @mmap-huge-preferred-loc-smem:
> + * @mmap-mlock-nomemset-preferred-loc-smem:
> + * @mmap-mlock-preferred-loc-smem:
> + * @mmap-new-huge-nomemset-preferred-loc-smem:
> + * @mmap-new-huge-preferred-loc-smem:
> + * @mmap-new-nomemset-preferred-loc-smem:
> + * @mmap-new-preferred-loc-smem:
> + * @mmap-new-race-nomemset-preferred-loc-smem:
> + * @mmap-new-race-preferred-loc-smem:
> + * @mmap-nomemset-preferred-loc-smem:
> + * @mmap-preferred-loc-smem:
> + * @mmap-prefetch-preferred-loc-smem:
> + * @mmap-prefetch-shared-preferred-loc-smem:
> + * @mmap-race-nomemset-preferred-loc-smem:
> + * @mmap-race-preferred-loc-smem:
> + * @mmap-remap-dontunmap-eocheck-preferred-loc-smem:
> + * @mmap-remap-dontunmap-preferred-loc-smem:
> + * @mmap-remap-eocheck-preferred-loc-smem:
> + * @mmap-remap-preferred-loc-smem:
> + * @mmap-remap-ro-dontunmap-eocheck-preferred-loc-smem:
> + * @mmap-remap-ro-dontunmap-preferred-loc-smem:
> + * @mmap-remap-ro-eocheck-preferred-loc-smem:
> + * @mmap-remap-ro-preferred-loc-smem:
> + * @mmap-shared-nomemset-preferred-loc-smem:
> + * @mmap-shared-preferred-loc-smem:
> + * @mmap-shared-remap-dontunmap-eocheck-preferred-loc-smem:
> + * @mmap-shared-remap-dontunmap-preferred-loc-smem:
> + * @mmap-shared-remap-eocheck-preferred-loc-smem:
> + * @mmap-shared-remap-preferred-loc-smem:
> + * @new-bo-map-nomemset-preferred-loc-smem:
> + * @new-bo-map-preferred-loc-smem:
> + * @new-busy-nomemset-preferred-loc-smem:
> + * @new-busy-preferred-loc-smem:
> + * @new-nomemset-preferred-loc-smem:
> + * @new-preferred-loc-smem:
> + * @new-prefetch-preferred-loc-smem:
> + * @new-race-nomemset-preferred-loc-smem:
> + * @new-race-preferred-loc-smem:
> + * @prefetch-benchmark:
>   *
>   * SUBTEST: prefetch-benchmark
>   * Description: Prefetch a 64M buffer 128 times, measure bandwidth of=20
> prefetch @@ -1020,7 +1112,7 @@ test_exec(int fd, struct=20
> drm_xe_engine_class_instance *eci,
>  	uint32_t bo =3D 0, bind_sync =3D 0;
>  	void **pending_free;
>  	u64 *exec_ufence =3D NULL, *bind_ufence =3D NULL;
> -	int i, j, b, file_fd =3D -1, prev_idx, pf_count;
> +	int i, j, b, file_fd =3D -1, prev_idx, pf_count, err;
>  	bool free_vm =3D false;
>  	size_t aligned_size =3D bo_size ?: xe_get_default_alignment(fd);
>  	size_t orig_size =3D bo_size;
> @@ -1133,6 +1225,15 @@ test_exec(int fd, struct=20
> drm_xe_engine_class_instance *eci,
>=20
>  	addr =3D to_user_pointer(data);
>=20
> +	if (flags & PREFERRED_LOC_SMEM) {
> +		err =3D xe_vm_madvise(fd, vm, to_user_pointer(data),
> bo_size, 0,
> +
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +		if (err)
> +			igt_warn("MADVISE_FAILURE err =3D %s, vm =3D%u
> data=3D%"PRIu64" alloc_size =3D %zu\n",
> +				 strerror(errno), vm, to_user_pointer(data),
> bo_size);
> +	}
> +
>  	if (flags & BO_UNMAP) {
>  		bo_flags =3D
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>  		bo =3D xe_bo_create(fd, vm, bo_size,
> @@ -1202,7 +1303,7 @@ test_exec(int fd, struct=20
> drm_xe_engine_class_instance *eci,
>  		uint64_t batch_addr =3D addr + batch_offset;
>  		uint64_t sdi_offset =3D (char *)&data[idx].data - (char *)data;
>  		uint64_t sdi_addr =3D addr + sdi_offset;
> -		int e =3D i % n_exec_queues, err;
> +		int e =3D i % n_exec_queues;
>  		bool fault_inject =3D (FAULT & flags) && i =3D=3D n_execs / 2;
>  		bool fault_injected =3D (FAULT & flags) && i > n_execs;
>=20
> @@ -1232,6 +1333,16 @@ test_exec(int fd, struct=20
> drm_xe_engine_class_instance *eci,
>  			aligned_alloc_type =3D __aligned_alloc(aligned_size, bo_size);
>  			next_data =3D aligned_alloc_type.ptr;
>  			igt_assert(next_data);
> +
> +			if (flags & PREFERRED_LOC_SMEM) {
> +				err =3D xe_vm_madvise(fd, vm,
> to_user_pointer(next_data), bo_size, 0,
> +
> 	DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> 	DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +				if (err)
> +					igt_warn("MADVISE_FAILURE err =3D
> %s, vm =3D%u data=3D%"PRIu64" alloc_size =3D %zu\n",
> +						  strerror(errno), vm,
> to_user_pointer(next_data), bo_size);
> +			}
> +
>  			__aligned_partial_free(&aligned_alloc_type);
>=20
>  			b =3D 0;
> @@ -1253,6 +1364,7 @@ test_exec(int fd, struct=20
> drm_xe_engine_class_instance *eci,
>  			sync[0].addr =3D to_user_pointer(bind_ufence);
>=20
>  			start =3D igt_nsec_elapsed(&tv);
> +
>  			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
>  					     1, region);
>  			end =3D igt_nsec_elapsed(&tv);
> @@ -1355,6 +1467,7 @@ test_exec(int fd, struct=20
> drm_xe_engine_class_instance *eci,
>  				} else {
>  					igt_assert_eq(data[idx].data,
>=20
> READ_VALUE(&data[idx]));
> +
>  					if (flags &
> PREFETCH_SYS_BENCHMARK) {
>  						struct timespec tv =3D {};
>  						u64 start, end;
> @@ -1429,6 +1542,7 @@ test_exec(int fd, struct=20
> drm_xe_engine_class_instance *eci,
>  				aligned_alloc_type =3D
> __aligned_alloc(aligned_size, bo_size);
>  				data =3D aligned_alloc_type.ptr;
>  				igt_assert(data);
> +
>=20
> 	__aligned_partial_free(&aligned_alloc_type);
>=20
>  				bo_flags =3D
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> @@ -1450,6 +1564,7 @@ test_exec(int fd, struct=20
> drm_xe_engine_class_instance *eci,
>  				}
>  				bo =3D 0;
>  				data =3D aligned_alloc(aligned_size, bo_size);
> +
>  				igt_assert(data);
>  			}
>  			addr =3D to_user_pointer(data);
> @@ -1460,6 +1575,15 @@ test_exec(int fd, struct=20
> drm_xe_engine_class_instance *eci,
>  		prev_idx =3D idx;
>  	}
>=20
> +	if (flags & PREFERRED_LOC_SMEM) {
> +		err =3D xe_vm_madvise(fd, vm, to_user_pointer(data),
> bo_size, 0,
> +
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +		if (err)
> +			igt_warn("MADVISE_FAILURE err =3D %s, vm =3D%u
> data=3D%"PRIu64" alloc_size =3D %zu\n",
> +				 strerror(errno), vm, to_user_pointer(data),
> bo_size);
> +	}
> +
>  	if (flags & PREFETCH_BENCHMARK) {
>  		igt_info("Prefetch VRAM execution took %.3fms, %.1f5 GB/s\n",
>  			 1e-6 * prefetch_ns,
> @@ -1587,6 +1711,7 @@ threads(int fd, int n_exec_queues, int n_execs,=20
> size_t bo_size,
>  	uint32_t vm =3D 0;
>  	bool go =3D false;
>  	void *alloc =3D NULL;
> +	int err;
>=20
>  	if ((FILE_BACKED | FORK_READ) & flags)
>  		return;
> @@ -1614,6 +1739,15 @@ threads(int fd, int n_exec_queues, int n_execs,=20
> size_t bo_size,
>  		alloc =3D aligned_alloc(SZ_2M, alloc_size);
>  		igt_assert(alloc);
>=20
> +		if (flags & PREFERRED_LOC_SMEM) {
> +			err =3D xe_vm_madvise(fd, vm, to_user_pointer(alloc),
> alloc_size, 0,
> +
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +			if (err)
> +				igt_warn("MADVISE_FAILURE err =3D %s, vm
> =3D%u data=3D%"PRIu64" alloc_size =3D %zu\n",
> +					  strerror(errno), vm,
> to_user_pointer(alloc), alloc_size);
> +		}
> +
>  		memset(alloc, 5, alloc_size);
>  		flags &=3D ~SHARED_ALLOC;
>  	}
> @@ -1831,6 +1965,7 @@ igt_main
>  		{ NULL },
>  	};
>  	int fd;
> +	int num_sections;
>=20
>  	igt_fixture {
>  		struct xe_device *xe;
> @@ -1843,7 +1978,21 @@ igt_main
>  		open_sync_file();
>  	}
>=20
> -	for (const struct section *s =3D sections; s->name; s++) {
> +
> +	num_sections =3D 0;
num_sections intialization to 0 can be done in declaration
> +	for (const struct section *s =3D sections; s[num_sections].name;
> num_sections++)
> +		;
> +
Please use check check patch.pl for indentation.

> +	for (int i =3D 0; i < num_sections * 2; i++) {
> +		struct section *s =3D &sections[i % num_sections];
> +
> +		if (i/num_sections =3D=3D 0) {
> +			static char modified_name[256];
> +			snprintf(modified_name, sizeof(modified_name),
> "%s-preferred-loc-smem", s->name);
> +			s->name =3D modified_name;
> +			s->flags |=3D PREFERRED_LOC_SMEM;
> +		}
> +
>  		igt_subtest_f("once-%s", s->name)
>  			xe_for_each_engine(fd, hwe)
>  				test_exec(fd, hwe, 1, 1, 0, 0, 0, NULL,
> --
> 2.43.0

