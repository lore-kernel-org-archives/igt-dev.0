Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C36CAC5A7
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 06:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D04510E3B1;
	Mon, 22 Sep 2025 06:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JfwsLdcy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0CF10E3B1
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 06:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758520997; x=1790056997;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tUJeX0Eo9drcfq5izMhiRrqa5oSLpWqGYzNPIKFmWsU=;
 b=JfwsLdcybe6ITi3ZxZ8kPzDPIV++fTxKjONSjrmnbeOfsCziinFp26+c
 lKp3WRXf+MRVXLVnSCUaC0PbNQFJHCjGQwXXfadWxAfm6yqBDsXU+L8lT
 3Igyj5D+ZZbog+CCJBN9T9V52F0HEXDzSBWgHsvxCWd9YooWrHQKakywV
 OXyhtQQ4w+A1EJvoKTi+QHNh6A/EoXH59ZSplpq4nDPE/pKJ5HjbieCzB
 QW5sHLT88BVWzz8TC0qyTMj6CPCBqR/cQ8KeQSF9AkSeQ4y2D6cjXluvx
 OQeA3EaPO2xCoMaz4owsPu9q8JbO/gPioQTHEXCbflATF4gk9Dn1ujtT/ Q==;
X-CSE-ConnectionGUID: B6+A5JYnQCiaobILVkQO5A==
X-CSE-MsgGUID: UekVau7mSmiVTopRJY8Jgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="72202465"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="72202465"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 23:03:17 -0700
X-CSE-ConnectionGUID: zk//pEIdSuWVAnTbcRvnuQ==
X-CSE-MsgGUID: fm6CHZ1VSL2mhGLnJZJEog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="175666077"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 23:03:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 21 Sep 2025 23:03:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 21 Sep 2025 23:03:16 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 21 Sep 2025 23:03:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9tYvgtdd0yi/Ky3photk7jAuMPBsP40tfOqOXmPx7htZbRXj63ECNS+2gj8bep/hbQG5CTp0fkIIfai4WtiMthynkQ6j7u8E47jr+5sJEb0HZU9wiFhNOhvkYeV06XBkk3smRkioTIEkfoJQuIrAKGFzGE/Q1qi/zf5rb0JXxc/tK07IAnwPSWVUyWFEaaL5nlg4imA8+0g/KAvFUO8pgs8cLZB4Lbdzz3GFHNHGmigVmYcX4fuyzMGXF2R8fYat94DhfD9yS9oCX4NkzVN4AOHyXHvpP4JudzkfTtQwmgguVSc9xlwNteXTFrp0IuX8DHW4Ebqa/8x/l95kO7YzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUJeX0Eo9drcfq5izMhiRrqa5oSLpWqGYzNPIKFmWsU=;
 b=xNDDNW9B0N6l/iBwQqaL5jtrScWbnuCYi2Wvx8qjaxZbW/jtYJtWm/1dwVO0sHxPK++yHBQVuvjzVeC3GuBr9Ie0S9WrYkOfDr3QvbuEre13EMVg1OPbyxwSCSs6tOR9vRsk+c1mBXUEEXxw17DEp2hBez0FPdM1qO9CwYH2CsO9sOnzco0/murtWhLR+5wvOqezfftpVPoThOwMuJdc7P22V1NxiHevAsivQ7n13IHlySxToxE1K2ViUl8Yt/+rmWL/QRR5rByorKuzvSGW0U7nUn10Jb1pRgCZH2kr6b+ZirMVnLRJK7JNB0sDCRfyT7b02iBLldBwjahoFC3TBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ5PPF5B09F0799.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::82c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Mon, 22 Sep
 2025 06:03:08 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9137.012; Mon, 22 Sep 2025
 06:03:08 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: =?utf-8?B?SnVoYS1QZWtrYSBIZWlra2lsw6Q=?= <juhapekka.heikkila@gmail.com>,
 "Garg, Nemesa" <nemesa.garg@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/kms_plane: Add test to validate odd panning
Thread-Topic: [PATCH i-g-t] tests/kms_plane: Add test to validate odd panning
Thread-Index: AQHcJltN8awPsXqhhE2YRSC0czTMYbSV3XQAgAjiSmA=
Date: Mon, 22 Sep 2025 06:03:08 +0000
Message-ID: <DM4PR11MB631252DA8D24509F130B3EBA9012A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250915160536.2839057-1-nemesa.garg@intel.com>
 <CAJ=qYWRZ+H3JS_CYg0gWS94AQR7BSqOy3hJPZit1=aZWe-A4rw@mail.gmail.com>
In-Reply-To: <CAJ=qYWRZ+H3JS_CYg0gWS94AQR7BSqOy3hJPZit1=aZWe-A4rw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ5PPF5B09F0799:EE_
x-ms-office365-filtering-correlation-id: 9612a249-e62e-4407-4fe2-08ddf99db43a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?K0RHR1h0cnBleXYwVHg5Nk10Umo3ZmJ6ZEpqTUwvN04vWjByZGFrUjVpY2xE?=
 =?utf-8?B?Y1I3K1JhSzF5QVBQR0FwN1Z5Nm1JcUUraUdRZzBTTGl4ZlJIeXd1RitCRFdJ?=
 =?utf-8?B?N2JnRE55VFVpdEc0THViNndiNHpuZHl1aEZCYUM3M1FOanhTdUpEZ1VRd210?=
 =?utf-8?B?d05sZ2ZRRll3cERVQkFxZUhZZXBJRThxWDZ0Wis3bll6NW5WcklDWUREWXRi?=
 =?utf-8?B?SlZNQ0xBYU04Rnhqck16Y1VJQ3AxME1LbWRQcGlzVHlkQ2ZydHg3ZG9Wc2Zx?=
 =?utf-8?B?OXRLRWsxWGhhamZuZWREbGxmcjRyY1dlc21DVmorNVRYQ3VodzN1bGoza0cw?=
 =?utf-8?B?ZlRpMDljMitSU25LK3Y0Z2lqczBSMWdzbkwwUmJIc1ZscTR6V1R1NDhjeUZX?=
 =?utf-8?B?QzNoMFdRZDVHUHhiY3pxR092SlgwR2R0T1gwL280djZySGlEUlFkS2VoS1pQ?=
 =?utf-8?B?cFpXL0RhU3lmNnNnY0VQQ2VWWTdLcE5sNlJxbi96N3p0N1R6MjJwTFA1T2lZ?=
 =?utf-8?B?LzdtcktackFLQ21sam1FSy92VmlwSngyVTN0N1g2bVhGRlNWNjZweDF4UzJ1?=
 =?utf-8?B?SzNjWVpRV3BxcVZaMm9xNmY0TWxRcVVuQXZBY3lySVpCS2JHLy9vVkg5dVY1?=
 =?utf-8?B?TWIxeXBNdHZEOGI3K0N0ZHY1NVp5RGVJSEpLK3BMcVlEdW5uRXpvRFRtd1NS?=
 =?utf-8?B?dVZvVExMSS9uK3c4dnQ5M0JTcHZoZzEwL20xdGhMVFY3TUp0WWR5cDh0dXVr?=
 =?utf-8?B?UC9lcGhrNHJkUFpFSWpGdTdORmtRTWszQUN3amdxUllLNW03SHBHekR5VXNV?=
 =?utf-8?B?c0R4ZWFSQzZKY3VKcTBFdWdxcVIyb1lHZkJHTHZCNjFYaDRNMWJicmJSWThL?=
 =?utf-8?B?cnA5SFIvbWRnMVd6M2x1L3crMEJEb1BBWEluK0hCWlJYQW5Sa0ZWQW1XS1JO?=
 =?utf-8?B?ejZnMWt3bUtJcXdCUVhTWm14eDN1WjNtQ21rc0ZTMTVQQ05xTkVsbXV4MTNS?=
 =?utf-8?B?eUNXTnNGank5cFNaaWZVT21wMjRjdEpBZmViZzcwZkhmdjJlMzNWR3NRMzE4?=
 =?utf-8?B?ZVlhVWtucHg1ZlBERmFXTm5ES2ttZDhmelVjZjNSR3Rra1RlV2FJemRSOG1y?=
 =?utf-8?B?TmxwZUNCbW8xUkl1TVRrMUU1eXIxNm5HQ1RkMWo4UE1MZ0IvQ1U3cE1uOXNL?=
 =?utf-8?B?RDBDT3JSczZkNkpBTXRUNjN3VVVUNEVYRjFHeVVPQ2J2VDgvem1qUk1DcUFF?=
 =?utf-8?B?bkdKbkRsWW5aUXUxczVNd3l5YlVHMzJ4M3lubDYrbktuaitvMDlVcnQ5elpx?=
 =?utf-8?B?K01LeDEwazlvSFoxQjJlZURLaTBwd0o4bDVyaDNjN1czTnFOaElOeHpIWm5p?=
 =?utf-8?B?OG5yMm45TlROd3Zqd1F6ZW40c2xrWDZLOVVsMys4bmhwbEYvQ2RCZnNrcHZC?=
 =?utf-8?B?R1dXRVBZeXVKM3hHUHp5Ums3cTFVeFA0SVBZY1VPWmJLbzRDRGg0NGJKTlVF?=
 =?utf-8?B?Y1NlSVJDUmp2S2krd0liKzNMbGtzb2ExYmwvMldLblhTaDZaaE51VlIvMTRu?=
 =?utf-8?B?RFVJSDBtRGx6alNjU0o0TGVhWG5DUlZyTFVZdzFmOEFHQTgveUxzN3ZhVDU4?=
 =?utf-8?B?cFJKZHMyUnRoNkxFOGdvTGM5TUZobm1rWmdLd2FwME5naWpxYXU2Q0NVQUNF?=
 =?utf-8?B?RTZ3RHhwc2p2WWhNOE5HVFFQaVZmY25yOStROU51b0FpSnVqWWI2dW9OWVp5?=
 =?utf-8?B?L0k2cWNnb1A4YnJqTjBnbWxYaDIyZG9TenFsaGc3MGptSzZWNkwrNFFGMUpO?=
 =?utf-8?B?NkNFekxQekJ3UlRsZjR3d3E3UzYrZ0lENE1sNUpNd2h6dnV2Szgva1RMWmRj?=
 =?utf-8?B?WEEvOEljKy9yU0REYnpIR1pDdFZrU290OHZLc3kxUnMxZ1FPMUlGT3M0OWNp?=
 =?utf-8?B?VHpkQ1hWZjZPRlhTTThlaVhxc0t2Y1FLUjJFYXNLdHhHWEpGdldtQVlQZnpk?=
 =?utf-8?Q?Bk0uLgZsFrlMhgzsnh2XeZyUENxTHA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEg0cHc3dE11RStUOWFrREJtemZ2UWpadkh4NnNkS3E5aFhxVjFielZDRUdl?=
 =?utf-8?B?czVkMVF6SVNBOHNta3lseDVHMm95LzZWYzJNaWtBYUJiR1NZUUV4a1N2ZE54?=
 =?utf-8?B?RXdGeEM4bWptc3ZKeWUxaXpKU1owbnV3WkpzY2ZXc0hWcGl5a2xmQTdIYk5Q?=
 =?utf-8?B?R3RIM0x5MzBTRlpWWXhkcjgwY293Q2M1ejgwU2RoQWgrbEt6SnRDSHI3YUZi?=
 =?utf-8?B?dE1obG9xM0xYSFlkb2ZObVFUdXBoSW5WYUlSM2ZvREx6aWZ2OEZDRnRDaHpt?=
 =?utf-8?B?WDhIeHgzYWtmaW9JR0pNa2E5TVhiV1g1czlUcVpCdTRmTFVxUnFlR1c0Vks1?=
 =?utf-8?B?bTRqaWY4MVBoVjFEMUxUZVBBT1ZTMFNENVpVL1g3UUFDRndPRzNwbk1oWkh2?=
 =?utf-8?B?ajE3VGZsSEtUV2JkRThqVFVxUjArNmJWajhGNzFDUGZqV1UrVW9nOXRRc1E1?=
 =?utf-8?B?Q2JRelNSWnEzQ0U4ZEhPUm9sUWQ5MkpwUWVzQWViNjRFMDVENENzZkJFV2F5?=
 =?utf-8?B?b0xRNWFhbmU4QkF0L3EvM3ByeVlvVGdSd0l4THJ5ajV2Y2lpT0VrYjJtYkc5?=
 =?utf-8?B?bHpWQkVhZDI3OG9pMmcrZjdqREkrSE1MNWc3UEtjNUl5K2dPVlN3ZkFoVGNE?=
 =?utf-8?B?NmJpYUM5TzltTTk3L0Z0bXZKSFV6N0UzQ2RZL3duaElZSVZibnFhbVBnTnAr?=
 =?utf-8?B?aHozOWw1WkdCSHJUaVVuWWwraGcwdGswUDd0ZE5lZFB0NFl6ZE50K2pMUUdu?=
 =?utf-8?B?TjBuTThtWmlJcFpIK1pSaExaN0xtMkxKY2Z6bUtlWjU1UGFVMXFXam5vT2RF?=
 =?utf-8?B?ckVPSlIwcU1JME5rcDFjVUJMc29YMkRkUUxHdmlJSmw4UDVVcUo0VVhMWktu?=
 =?utf-8?B?MjdaOHlIYWFQbWorNWt1ZlFrTEZ1cGZ3b2RSRlJ1bEs0VTN4WGN6UUk5eUlL?=
 =?utf-8?B?VW83Z3FScnA2WUZvL1dtTjgyS3pIRWhpckxPZHdVbDY4VUhXejRienRtYjJD?=
 =?utf-8?B?Y1E3aHNoU0xqV24xNTVzYTBzSUNISGJtbVU4Zy8xd1RLOGRndVlWWG5WemdN?=
 =?utf-8?B?T0NGSDJ5TkllM2FNN01XVnVFRTN6aDRLTmJnMDlMRTlvdVd3bWYxd1d1SkF5?=
 =?utf-8?B?U3p2K3dpVEcxbGNlMkRtVlN6cExoTGFxeVNFRUFJS2ZUVzMyQVdpYjl3YnNZ?=
 =?utf-8?B?WnUxTXJFSEpXUUc4c1dTNERDV0sxbHdKTEI2ZHo0VytHdnkrMUlCTXdQMW9I?=
 =?utf-8?B?SllWd1R5VDF6b245TTZ5MzVmVU0wWStkUFBLL0ZIczZleTBKUVFmVU16M1d6?=
 =?utf-8?B?Vk90Zm0yR0VqNXlDWm9jMzRyMGVZVWFyYWZlS0VYbkFCb3k1SHZ0TVdaUEJz?=
 =?utf-8?B?OXdteHVSWElCUnYwYUU5WGpFbzVxU1l3dVRHZllGVldZWXVJK2g4TjFYdlp0?=
 =?utf-8?B?aWhOVm0zSW84bVV1UzVPVW1vbDE1dFRKYkZvdzN1Si9YTS82ekU0cU5SOEs2?=
 =?utf-8?B?UnNxRmxoWXZQU2pEaFRId1o2OU1JcDBWbng0TjdXY0dFUmFjazdiVEcyb04y?=
 =?utf-8?B?cllxK2VsOWtnbTFyemppOHgxUFJwdWE2RlVnLzNnUWJISjhPdXNNV2V5MUpK?=
 =?utf-8?B?ZFprZUJBWk5vdlFwT1Fyb0pYR0c2dlEyckt2dGFpMXdkK0k4Unc5T0QydVNM?=
 =?utf-8?B?VUpOZGl5VzhyNVpTeXBiZVdiQzhrR1E5Q09taEx6S0orcVpZNGZVcWdCSEVv?=
 =?utf-8?B?MTA4UXFpQTVGbnp5MGlzcXZSSkgrSHJVQ1FFSXhES3FESStDdm1sTFJSZ2FG?=
 =?utf-8?B?OW11WHY4djRXNTZzRGhUOUZsR1Z1eTBRamJuVDNtZ3Vib3RzWFVnSTF6QXdK?=
 =?utf-8?B?MlZuZG03NHhvcWxKZEtSMWpUY2hPZ2ZBZzU5c1VQV0NTWWFXa2tGNk16M1JB?=
 =?utf-8?B?R3RvR3VIbEFnQzlobUE1cE0zQ0JHYTBMVWtNQWpUUzR1bVdpZjVhQUtuRHRw?=
 =?utf-8?B?TFZ6ZlIzaVJvZTBRalJVRW41NXRDeFZoZ2FtMi9ZL3FIeFExMHdmQlVxYkFz?=
 =?utf-8?B?SkZ2NEE4YXdLSHJzaTR5LzVOOHNDRTBDYXMxVEo1RXFyTGUyQjMzZ3VNY2Np?=
 =?utf-8?Q?u0FI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9612a249-e62e-4407-4fe2-08ddf99db43a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 06:03:08.4854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W6QWxLdSZrU/T+J10R+1t2JMi8YMbKaUhvN/QicMxUlRycgEG6+G9+DI8d8102/rwZkvCffnV8yZKxghttaklA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5B09F0799
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSnVoYS1QZWtrYQ0KPiBI
ZWlra2lsw6QNCj4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDE2LCAyMDI1IDc6NTEgUE0NCj4g
VG86IEdhcmcsIE5lbWVzYSA8bmVtZXNhLmdhcmdAaW50ZWwuY29tPg0KPiBDYzogaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdF0gdGVzdHMv
a21zX3BsYW5lOiBBZGQgdGVzdCB0byB2YWxpZGF0ZSBvZGQgcGFubmluZw0KPiANCj4gSGkgTmVt
ZXNhLA0KPiANCj4gZmV3IGNvbW1lbnRzIGJlbG93DQo+IA0KPiBPbiBNb24sIFNlcCAxNSwgMjAy
NSBhdCA3OjEw4oCvUE0gTmVtZXNhIEdhcmcgPG5lbWVzYS5nYXJnQGludGVsLmNvbT4NCj4gd3Jv
dGU6DQo+ID4NCj4gPiBUaGlzIGZlYXR1cmUgY3JlYXRlcyBhIE5WMTIgcGxhbmUgaGF2aW5nIHR3
byBmcmFtZWJ1ZmZlcnMgYW5kIG1vdmluZw0KPiA+IGl0IHRvIG9kZCBwb3NpdGlvbiBhbmQgdGhl
biBkbyBjb250aW51b3VzIGZsaXAgYWxvbmcgd2l0aCB0aGUgY2hhbmdlDQo+ID4gaW4gdGhlIHdp
ZHRoIG9mIGZyYW1lYnVmZmVyLg0KPiA+IFRoaXMgaXMgdG8gY2hlY2sgd2hldGhlciBwYW5uaW5n
IGF0IG9kZCBwb3NpdGlvbiBpcyBzdXBwb3J0ZWQgb3Igbm90Lg0KPiA+DQo+ID4gdjI6IEFkZCB0
ZXN0IGluIGttc19wbGFuZS5bU3dhdGldDQo+ID4gdjM6IFJlbW92ZSBleHRyYSBwYXJhbWV0ZXJz
W1ByYW5heV0NCj4gPiB2NDogQWRkIGNoZWNrIGZvciBtb2RpZmllcg0KPiA+IHY1OiBBZGRpbmcg
dGhlIGJyZWFrIGNvbmRpdGlvbg0KPiA+IHY2OiBDaGFuZ2UgdGhlIGZiIHNpemUNCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IE5lbWVzYSBHYXJnIDxuZW1lc2EuZ2FyZ0BpbnRlbC5jb20+DQo+ID4g
LS0tDQo+ID4gIHRlc3RzL2ttc19wbGFuZS5jIHwgMTA3DQo+ID4gKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTA3IGlu
c2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcGxhbmUuYyBiL3Rl
c3RzL2ttc19wbGFuZS5jIGluZGV4DQo+ID4gZDA4ZWM4MWU0Li40ODcyYjhjZTUgMTAwNjQ0DQo+
ID4gLS0tIGEvdGVzdHMva21zX3BsYW5lLmMNCj4gPiArKysgYi90ZXN0cy9rbXNfcGxhbmUuYw0K
PiA+IEBAIC04MSw2ICs4MSwxNSBAQA0KPiA+ICAgKiBAZm9ybWF0LXNvdXJjZS1jbGFtcGluZzog
ICAgICAgICAgd2l0aCBzb3VyY2UgY2xhbXBpbmcNCj4gPiAgICovDQo+ID4NCj4gPiArLyoqDQo+
ID4gKyAqIFNVQlRFU1Q6IG9kZC1wYW5uaW5nDQo+ID4gKyAqIERlc2NyaXB0aW9uOiBWZXJpZnkg
dGhhdCBvZGQgcGFubmluZyBpbiBob3Jpem9udGFsIGRpcmVjdGlvbiBmb3INCj4gPiArcGxhbmFy
IGZvcm1hdA0KPiA+ICsgKiBEcml2ZXIgcmVxdWlyZW1lbnQ6IGk5MTUsIHhlDQo+ID4gKyAqIEZ1
bmN0aW9uYWxpdHk6IHBsYW5lLCBwYW5uaW5nDQo+ID4gKyAqIE1lZ2EgZmVhdHVyZTogR2VuZXJh
bCBEaXNwbGF5IEZlYXR1cmVzDQo+ID4gKyAqIFRlc3QgY2F0ZWdvcnk6IGZ1bmN0aW9uYWxpdHkg
dGVzdA0KPiA+ICsgKi8NCj4gPiArDQo+ID4gIC8qDQo+ID4gICAqIFRocm93IGF3YXkgZW5vdWdo
IGxzYnMgaW4gcGl4ZWwgZm9ybWF0cyB0ZXN0cw0KPiA+ICAgKiB0byBnZXQgYSBtYXRjaCBkZXNw
aXRlIHNvbWUgZGlmZmVyZW5jZXMgYmV0d2VlbiBAQCAtOTMsNiArMTAyLDkgQEANCj4gPiAgI2Rl
ZmluZSBDUlRDX1JFU1RSSUNUX0NOVCAgICAgIDINCj4gPiAgI2RlZmluZSBTSU1fQ1JUQ19SRVNU
UklDVF9DTlQgIDENCj4gPg0KPiA+ICsjZGVmaW5lIFBMQU5FX1dJRFRIIDgxMA0KPiA+ICsjZGVm
aW5lIFBMQU5FX0hFSUdIVCA1OTANCj4gPiArDQo+ID4gIHR5cGVkZWYgc3RydWN0IHsNCj4gPiAg
ICAgICAgIGZsb2F0IHJlZDsNCj4gPiAgICAgICAgIGZsb2F0IGdyZWVuOw0KPiA+IEBAIC0xMzIz
LDYgKzEzMzUsOTcgQEAgc3RhdGljIGJvb2wgaXNfcGlwZV9saW1pdF9yZWFjaGVkKGludCBjb3Vu
dCkNCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIGNvdW50ID49IENSVENfUkVTVFJJQ1RfQ05U
ICYmICFhbGxfcGlwZXM7ICB9DQo+ID4NCj4gPiArc3RhdGljIHZvaWQNCj4gPiArcHJlcGFyZV9w
bGFuZXNfcGFubmluZyhpZ3RfZGlzcGxheV90ICpkaXNwbGF5LCBjb25zdCBlbnVtIHBpcGUgcGlw
ZV9pZCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgIGlndF9vdXRwdXRfdCAqb3V0cHV0KSB7
DQo+IA0KPiBwcmVwYXJlX3BsYW5lc19wYW5uaW5nIG5hbWUgbWF5YmUgY291bGQgYmUgY2hhbmdl
ZCB0byBzb21ldGhpbmcgdGhhdCBzYXlzDQo+IHRoaXMgaXMgdGhlIHRlc3QsIG5vdCBqdXN0IHBy
ZXBhcmUuDQo+IA0KPiA+ICsgICAgICAgaWd0X3BsYW5lX3QgKnByaW1hcnk7DQo+ID4gKyAgICAg
ICBzdHJ1Y3QgaWd0X2ZiIHByaW1hcnlfZmJfMSwgcHJpbWFyeV9mYl8yOw0KPiA+ICsgICAgICAg
dW5zaWduZWQgaW50IGZiX2lkXzEsIGZiX2lkXzI7DQo+ID4gKyAgICAgICBpbnQgaiA9IDAsIHJl
dDsNCj4gPiArDQo+ID4gKyAgICAgICBpZ3Rfb3V0cHV0X3NldF9waXBlKG91dHB1dCwgcGlwZV9p
ZCk7DQo+ID4gKw0KPiA+ICsgICAgICAgcHJpbWFyeSA9IGlndF9vdXRwdXRfZ2V0X3BsYW5lX3R5
cGUob3V0cHV0LA0KPiA+ICsgRFJNX1BMQU5FX1RZUEVfUFJJTUFSWSk7DQo+ID4gKw0KPiA+ICsg
ICAgICAgaWYgKCFpZ3RfcGxhbmVfaGFzX2Zvcm1hdF9tb2QocHJpbWFyeSwgRFJNX0ZPUk1BVF9O
VjEyLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX0ZPUk1B
VF9NT0RfTElORUFSKSkgew0KPiA+ICsgICAgICAgICAgICAgICBpZ3RfaW5mbygicGxhbmUtJWQg
ZG9lcyBub3Qgc3VwcG9ydHMgTlYxMiBmb3JtYXQgYW5kIExpbmVhcg0KPiBtb2RpZmllclxuIiwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgcHJpbWFyeS0+aW5kZXgpOw0KPiA+ICsgICAg
ICAgICAgICAgICByZXR1cm47DQo+IA0KPiBJIHRoaW5rIHRoaXMgbWFrZSB0aGUgdGVzdCByZXBv
cnQgc3VjY2VzcyB3aGVuIG5vdGhpbmcgd2FzIHRlc3RlZD8NCj4gTWF5YmUgbmVlZCBzb21ldGhp
bmcgYWxvbmcgdGhlIGxpbmVzIG9mIGlndF9za2lwX29uKC4uKSBvciBzbz8NCg0KaWd0X3JlcXVp
cmVfZiBzaG91bGQgYmUgYWRkZWQgSSBmZWVsLg0KDQo+IA0KPiA+ICsgICAgICAgfQ0KPiA+ICsN
Cj4gPiArICAgICAgIGZiX2lkXzEgPSBpZ3RfY3JlYXRlX3BhdHRlcm5fZmIoZGlzcGxheS0+ZHJt
X2ZkLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA4MTAsIDU5
MCwNCj4gXg0KPiB0aGlzIHNpemUgeW91IGhhdmUgZGVmaW5lZCBpbiBQTEFORV9XSURUSCBhbmQg
UExBTkVfSEVJR0hUDQo+IA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBEUk1fRk9STUFUX05WMTIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIERSTV9GT1JNQVRfTU9EX0xJTkVBUiwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgJnByaW1hcnlfZmJfMSk7DQo+ID4gKw0KPiA+ICsgICAgICAg
ZmJfaWRfMiA9IGlndF9jcmVhdGVfcGF0dGVybl9mYihkaXNwbGF5LT5kcm1fZmQsDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDgxMCwgNTkwLA0KPiBeDQo+IGhl
cmUgYWxzbyBQTEFORV9XSURUSCBhbmQgUExBTkVfSEVJR0hUDQo+IA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fRk9STUFUX05WMTIsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9GT1JNQVRfTU9EX0xJTkVBUiwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnByaW1hcnlfZmJf
Mik7DQo+IA0KPiBJIHdhcyB3b25kZXJpbmcgd2h5IDIgZnJhbWVidWZmZXJzPyBEb2VzIHRoaXMg
dGVzdCBuZWVkIGZsaXBwaW5nPw0KPiANCj4gPiArDQo+ID4gKyAgICAgICBpZ3RfYXNzZXJ0KGZi
X2lkXzEpOw0KPiA+ICsgICAgICAgaWd0X2Fzc2VydChmYl9pZF8yKTsNCj4gDQo+IGlndF9jcmVh
dGVfcGF0dGVybl9mYiBhbHJlYWR5IGFzc2VydHMgdGhlc2UgZmJfaWRzLCBidXQgYXMgdGhpcyBp
cyBub3QgY3JjIHRlc3QgeW91DQo+IGNvdWxkIGFib3ZlIGp1c3QgdXNlIGlndF9jcmVhdGVfZmIg
aW5zdGVhZCBvZiBpZ3RfY3JlYXRlX3BhdHRlcm5fZmIgKGFuZCB0aGVuDQo+IHdvdWxkIG5lZWQg
dGhlc2UgYXNzZXJ0cykNCj4gDQo+ID4gKw0KPiA+ICsgICAgICAgaWd0X3BsYW5lX3NldF9mYihw
cmltYXJ5LCAmcHJpbWFyeV9mYl8xKTsNCj4gPiArDQo+ID4gKyAgICAgICBpZ3RfcGxhbmVfc2V0
X3NpemUocHJpbWFyeSwgUExBTkVfV0lEVEgsIFBMQU5FX0hFSUdIVCk7DQo+ID4gKyAgICAgICBp
Z3RfcGxhbmVfc2V0X3Bvc2l0aW9uKHByaW1hcnksIC01MDEsIDIwMCk7DQo+ID4gKw0KPiA+ICsg
ICAgICAgcmV0ID0gaWd0X2Rpc3BsYXlfdHJ5X2NvbW1pdF9hdG9taWMoZGlzcGxheSwNCj4gPiAr
IERSTV9NT0RFX0FUT01JQ19BTExPV19NT0RFU0VULCBOVUxMKTsNCj4gPiArDQo+ID4gKyAgICAg
ICBkbyB7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChqICUgMiA9PSAwKSB7DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaWd0X3BsYW5lX3NldF9mYihwcmltYXJ5LCAmcHJpbWFyeV9mYl8x
KTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZ3RfcGxhbmVfc2V0X3NpemUocHJpbWFy
eSwgUExBTkVfV0lEVEggLSBqLA0KPiA+ICsgUExBTkVfSEVJR0hUKTsNCj4gDQo+IHdoZW4geW91
IGNoYW5nZSBwbGFuZSB3aWR0aCBidXQgbm90IGZiIHdpZHRoLCBJIHRoaW5rIGhlcmUgZmIgd2ls
bCBiZSBzY2FsZWQ/DQo+IA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGlndF9k
aXNwbGF5X3RyeV9jb21taXRfYXRvbWljKGRpc3BsYXksIDAsIE5VTEwpOw0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGlmIChyZXQgPT0gLTIyKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICAgICAgICAgIH0gZWxzZSB7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgaWd0X3BsYW5lX3NldF9mYihwcmltYXJ5LCAmcHJpbWFyeV9m
Yl8yKTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZ3RfcGxhbmVfc2V0X3NpemUocHJp
bWFyeSwgUExBTkVfV0lEVEggLSBqLCBQTEFORV9IRUlHSFQpOw0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJldCA9IGlndF9kaXNwbGF5X3RyeV9jb21taXRfYXRvbWljKGRpc3BsYXksIDAs
IE5VTEwpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQgPT0gLTIyKQ0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICAgICAg
ICAgIH0NCj4gPiArICAgICAgICAgICAgICAgaisrOw0KPiA+ICsgICAgICAgfSB3aGlsZSAoaiA8
IDIwKTsNCj4gDQo+IHRlc3QgZGVzY3JpcHRpb24gdGFsayBhYm91dCAiVmVyaWZ5IHRoYXQgb2Rk
IHBhbm5pbmcgaW4gaG9yaXpvbnRhbCINCj4gYnV0IHlvdXIgbG9vcCBzZXQgZmIsIHRoZW4gc2V0
IHBsYW5lIHNpemUuIEkgdGhpbmsgZm9yIHBhbiB5b3UnZCBuZWVkIHRvIGVpdGhlciBzZXQgZmIN
Cj4gb3IgcGxhbmUgcG9zaXRpb24/IE5vdyBpdCBsb29rIGxpa2UgdGhpcyBpcyBtb3JlIGEgc2Nh
bGVyIHRlc3QgZm9yIG52MTIgYXQgdGhlIGVkZ2Ugb2YNCj4gcGlwZS4NCj4gDQo+ID4gKw0KPiA+
ICsgICAgICAgaWd0X2Fzc2VydF9lcShyZXQsIC0yMik7DQo+ID4gKw0KPiA+ICsgICAgICAgaWd0
X3BsYW5lX3NldF9mYihwcmltYXJ5LCBOVUxMKTsNCj4gPiArICAgICAgIGlndF9vdXRwdXRfc2V0
X3BpcGUob3V0cHV0LCBQSVBFX05PTkUpOw0KPiA+ICsgICAgICAgaWd0X2Rpc3BsYXlfdHJ5X2Nv
bW1pdDIoZGlzcGxheSwgQ09NTUlUX0FUT01JQyk7DQo+ID4gKw0KPiA+ICsgICAgICAgaWd0X3Jl
bW92ZV9mYihkaXNwbGF5LT5kcm1fZmQsICZwcmltYXJ5X2ZiXzEpOw0KPiA+ICsgICAgICAgaWd0
X3JlbW92ZV9mYihkaXNwbGF5LT5kcm1fZmQsICZwcmltYXJ5X2ZiXzIpOyB9DQo+ID4gKw0KPiA+
ICtzdGF0aWMgdm9pZCBydW5fdGVzdF9vZGRfcGFuKGRhdGFfdCAqZGF0YSkgew0KPiA+ICsgICAg
ICAgaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSA9ICZkYXRhLT5kaXNwbGF5Ow0KPiA+ICsgICAgICAg
ZW51bSBwaXBlIHBpcGU7DQo+ID4gKyAgICAgICBpZ3Rfb3V0cHV0X3QgKm91dHB1dDsNCj4gPiAr
ICAgICAgIGludCBjb3VudCA9IDA7DQo+ID4gKw0KPiA+ICsgICAgICAgZm9yX2VhY2hfcGlwZV93
aXRoX3ZhbGlkX291dHB1dChkaXNwbGF5LCBwaXBlLCBvdXRwdXQpIHsNCj4gPiArICAgICAgICAg
ICAgICAgaWd0X2Rpc3BsYXlfcmVzZXQoZGlzcGxheSk7DQo+ID4gKw0KPiA+ICsgICAgICAgICAg
ICAgICBpZ3Rfb3V0cHV0X3NldF9waXBlKG91dHB1dCwgcGlwZSk7DQo+ID4gKyAgICAgICAgICAg
ICAgIGlmICghaW50ZWxfcGlwZV9vdXRwdXRfY29tYm9fdmFsaWQoZGlzcGxheSkpDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAg
ICBpZ3RfZHluYW1pY19mKCJwaXBlLSVzLSVzIiwga21zdGVzdF9waXBlX25hbWUocGlwZSksDQo+
IGlndF9vdXRwdXRfbmFtZShvdXRwdXQpKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBy
ZXBhcmVfcGxhbmVzX3Bhbm5pbmcoZGlzcGxheSwgcGlwZSwgb3V0cHV0KTsNCj4gPiArDQo+ID4g
KyAgICAgICAgICAgICAgIGlmIChpc19waXBlX2xpbWl0X3JlYWNoZWQoKytjb3VudCkpDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICB9DQo+ID4gK30NCj4g
PiArDQo+ID4gIHN0YXRpYyB2b2lkIHJ1bl90ZXN0KGRhdGFfdCAqZGF0YSwgdm9pZCAoKnRlc3Qp
KGRhdGFfdCAqLCBlbnVtIHBpcGUpKQ0KPiA+IHsNCj4gPiAgICAgICAgIGVudW0gcGlwZSBwaXBl
Ow0KPiA+IEBAIC0xNDAxLDYgKzE1MDQsMTAgQEAgcnVuX3Rlc3RzX2Zvcl9waXBlX3BsYW5lKGRh
dGFfdCAqZGF0YSkNCj4gPiAgICAgICAgICAgICAgICAgcnVuX3Rlc3QoZGF0YSwgZHluYW1pY190
ZXN0X2hhbmRsZXIpOw0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4gKyAgICAgICBpZ3RfZGVzY3Jp
YmUoInZlcmlmeSB3aGV0aGVyIG9kZCBwYW5uaW5nIGlzIHN1cHBvcnRlZCBvciBub3QiKTsNCj4g
PiArICAgICAgIGlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pYygib2RkLXBhbm5pbmciKQ0KPiA+ICsg
ICAgICAgICAgICAgICBydW5fdGVzdF9vZGRfcGFuKGRhdGEpOw0KPiA+ICsNCj4gPiAgICAgICAg
IGlndF9kZXNjcmliZSgidmVyaWZ5IHBsYW5hciBzZXR0aW5ncyBmb3IgcGl4ZWwgZm9ybWF0IGFy
ZSBhY2NlcHRlZCBvcg0KPiByZWplY3RlZCBjb3JyZWN0bHkiKTsNCj4gPiAgICAgICAgIGlndF9z
dWJ0ZXN0X2YoInBsYW5hci1waXhlbC1mb3JtYXQtc2V0dGluZ3MiKQ0KPiA+ICAgICAgICAgICAg
ICAgICB0ZXN0X3BsYW5hcl9zZXR0aW5ncyhkYXRhKTsNCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+
DQo=
