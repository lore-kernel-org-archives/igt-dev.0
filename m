Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E9CEF5863
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 04:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B9410E129;
	Mon, 23 Feb 2026 04:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O5zg8T96";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C3310E129
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 04:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771820943; x=1803356943;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ub0QMVSi2aOZ1x3Fn/ZeG6n5YkETZGdSu3TSTcS1NOY=;
 b=O5zg8T965N3X1yUgbKckqFZn2LMyrtkf+8QVUhywGOOCSlO3Cg50v3Rj
 W8+UHgXeiwq2WnRhGE/+teQt9Sa0w0OU9QeuK76brzw5JkvOwf1jdHxi6
 zyxSv+Ph63fhXM/3NIyZFi3HjgQgwIqhoz2GkwqzqhhuTj70DVczcV/i7
 oYpJRQu8IsgVpVQcaH64GukxuOSDUuIZbukW7Hifo0M7TsId3VaicSaii
 uhKVD4D/hn+GZnYytxEll1J7wnBCIGO7SzZmrfdGavlj3YSgSV6K1xVgC
 dCFVshdrRyTGIRArUaqoqvdJCTXbW08+9QxKLXlns5O6knaHcrh5R9p56 A==;
X-CSE-ConnectionGUID: w8txtLw1RRObaLd+WIHgWQ==
X-CSE-MsgGUID: mty9HY3mQNCAwWurOv30TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72718715"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72718715"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:29:03 -0800
X-CSE-ConnectionGUID: mZCMA13vRcG+5tgoaZWhfg==
X-CSE-MsgGUID: 2gqTH/GgQN6oUYh93MrG2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="213841461"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:29:03 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 20:29:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 20:29:02 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.71)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 20:29:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=futtEmjyPQuA0aAgIcr6UQlp91rsS7CqUM0xjdLq027IsEK27Y9lesBLjupLezpwKtWCsQ2+EJZHAe/fRU1AcL/A2ZZ+J+jj04axilUFIJjcJNmEnHY6GLikHzjMwPFciMNXy+MSqagiEoJqgWJzF7CpfdJ8MTVq9fCr70xJDox7hrA8JMq3Fe9qIwMOu2Xz6m+Pre7/zRXD4aVEItilyYO5q3u9kohAfjvi77CEMfiIFPWELZt+63IqudWAXinC6ATKyPuKKPHqoLVul7Rv1jmQDpEwxjEMnRfrFdRjgeWbnlpomKj1r5JqXrvl+P7AevsS0JXfbwjph7XWfrEZbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ub0QMVSi2aOZ1x3Fn/ZeG6n5YkETZGdSu3TSTcS1NOY=;
 b=h5CsfZvP/8Lv4sjbihJQ4ZTntOdk4HQqPFrWIi8Q2LGGKNTMR81XsCP9eyVyHAnZwKM7AUrN7EKOFChpu27PHt4h08U/XmuN1mnSnJqGcyC+CVFjsPwwnpnIsuhplbOG4Zy8kleKRPOGoxraMhgPL/eYFc6IYQe+ammNIFioRMMM90030DSqDm47X9ef+M/yNKgK9LBcoD3eA38G5EGDJ7H22wDVtWj/q2MQC9EVE52eI2vwKpBk4h8H8HtgdZXO2aMaI1Q5rEx1wj4xeEY//TxoSxCDCCBq16fDMqSM5w+lG2RxLJoYAhItyCCY/rTXh/H3txWdOh71Q6haiq00jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by MN0PR11MB6085.namprd11.prod.outlook.com (2603:10b6:208:3cf::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 04:29:00 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 04:29:00 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 1/8] drm-uapi/xe_drm: Add UAPI support for
 purgeable buffer objects
Thread-Topic: [PATCH i-g-t v3 1/8] drm-uapi/xe_drm: Add UAPI support for
 purgeable buffer objects
Thread-Index: AQHcn7Yol3VXwbqGTkiKnv41m/JKNLWPujIw
Date: Mon, 23 Feb 2026 04:29:00 +0000
Message-ID: <BL1PR11MB55252D5B6142F8A728A48CA98477A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-2-arvind.yadav@intel.com>
In-Reply-To: <20260217023423.2632617-2-arvind.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|MN0PR11MB6085:EE_
x-ms-office365-filtering-correlation-id: 3d5211fd-b621-4801-b37b-08de7294115e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?ZmlpN2tMSHo5NnhHQ2V4c29HQ0p5ZDRJM2ZURUZ0cnY3TktKcDBsQUhPL2xN?=
 =?utf-8?B?cWREQjZZaGtIVTBIaGo1dnd1K3NubzBtZXk5SnJsSWtmNkYxUkZ5dC94ZGJw?=
 =?utf-8?B?RDBpTkVPV0JOTkViNGNDUVdjVzdlN2UzUFhlSWhYWXFkY3ZjTmlvaVhGcTd2?=
 =?utf-8?B?bkU0amRmVWEzclc0NU5jMXp0cWJwNU5IYzRFODlTSERUWXVneDBFSEM2V3FE?=
 =?utf-8?B?NmRLV3ZKYWVqOHdtSVNWYkZ1b2QxdkJhRkEwU29COFpjdHY4L2RDUk1Zc3BW?=
 =?utf-8?B?dG9YemdvUFRPN3FOcVV3Yk9WTzFhMXF5WlZrUlZEbzhDdTB3RU5xd0lzSXVk?=
 =?utf-8?B?bk1SdnNvR0hacllFUW9IeStPdWYvK2pnWTl4QzhFR1dEejFwczVNa1hBUG1S?=
 =?utf-8?B?azhDUFNDRU1XV3BFSHNveW5SOHU4L2ZuM3JzczgxblRuQXMvN0hCekx0M1JL?=
 =?utf-8?B?OWhGblRCZkM4R0d2dVVacWM3WUtsUy8zQ2lZc2tqWjUyUmwwQ2F3UVJ2Z0Vu?=
 =?utf-8?B?eXk1a0treHIrbFlwenZyQnUweGw1SnVpbFJna2doSmF4S3NTUVowNWx6YmRk?=
 =?utf-8?B?TXpkd0JkR2lTOGZaSGExT2dxUXFsNVVYb0lXTS95NFFiWmpoMVFCYTdoTnBU?=
 =?utf-8?B?NjZrT0xHdkg2WkZxOXlrbzk4YVpQNUloUjFnRndIUGFjTkVGbkRhclplN0cz?=
 =?utf-8?B?WVhrNVNMbU1OUG9EbkEvcUxjMjYxOCtGMFU5djQ0OCtwMHhGd3dnTEt4RXFq?=
 =?utf-8?B?N3U2dnR4eTFQTWt0R3FtNWJTK01SQUYyRlZtd1RqdGlwSUF1aDgxdEovMGha?=
 =?utf-8?B?V2xYWDlXVFBwTUlNOU1ObGNkTHo5djlyVmNKTE1JMy9CVlJITVVmR3FxZnl2?=
 =?utf-8?B?RDU3d3F4K01XUHlsUGM0YzhIbTNBWWowaHZvRU5BL20waXE1MWd4bC9kZTJl?=
 =?utf-8?B?WlgrUTFqMWNQVVZZY21FWXY1VVBsMklJS0dROFdyKzhSYUwzUHE5ajVBYU5E?=
 =?utf-8?B?MThsZzVvNnJSenVIQUdZUWM5eXpCemxhQ3FjcWx4Q0E4RHFGMXJZTkNUR1ZT?=
 =?utf-8?B?eW9LbzhkZEk1ZFRmUmZ4NThYRHZ2d0xuWldOb3ozZ1RESEhTVUtycVRFcnJ0?=
 =?utf-8?B?K1Y0N2J5UnNOdzl2dy91RVQ3WkJaaTFZaS9YZkJaL2FqSHhQKzN6VTRGK2Vl?=
 =?utf-8?B?QTF4ZVd5RlAvTHFXZXhUR1dSa3E2MDFGZXp4UEd6dFJLVFFLSlk1b0dndTA5?=
 =?utf-8?B?aFNZTng2Qm5mZ3h3dS9kdU9xOUdKZXVxNytKTFdUZHNGeldld1hSbDVBaFRx?=
 =?utf-8?B?bTVFQUhGVUpVUi9FdStpTDJMV0xwdE1SdkM0MjcvT2x1N2hXUE8xeGxDRUJq?=
 =?utf-8?B?UG9MMkVxQTk3K1gyV2xnUGF4a21qb21OQktDRUNRSDQ4VjNYdENLNHZJWnJx?=
 =?utf-8?B?MXVmZmNNN3lWNGFlcjdPcDZadkpZS0VUNWNEZHY3QVBXVzRFV3ZpVVVmcVFM?=
 =?utf-8?B?SXFpODVPOFNXM1U2dmdLcjlsY1gyUW9xbnhXRjRNcGsyRVNvNXlkSU5tdWJD?=
 =?utf-8?B?STM0N20vSHZFVDl1WlRTalg3L1RibVNSL251aTNsOHdDZnBXdCtuUUVOVDBN?=
 =?utf-8?B?Q0svT3pQZlhvMURsdHZVNnVwNGRWLzJrcW5UbmU2M0t0RHc2MWR2Ykt3K1dM?=
 =?utf-8?B?UFlLVlNpR3d0VytQOStJakNVd2hCREl4TjJnVUpuK09USGl0NVhBVVo3STdT?=
 =?utf-8?B?YXl4RmpWTWRtQ2VYY0NQWGloZVE3d05nZGNKOFpjNmcvNTVTYldPNUk3cGsv?=
 =?utf-8?B?ejZpOVlyMlFkNmlPNmZEN1hmY1ROYmNqVFZlT3h0d2JYOEtIenRMeVJ5M0JC?=
 =?utf-8?B?eXpjUVRCUWtaemRueDdNOXhUQXVhajdPbUg2ZHovbnBnVFRWN3Jlbk9vaHRI?=
 =?utf-8?B?a3B4T2RxbnJ5OHR2RVVuODB5SjhSeXJyR2NBQ0tOU3pNVjBtMDUzK0FlamlM?=
 =?utf-8?B?SUIzMkk2RFpTdG1XYXdzM0h5dUJHaHdHUE9tTDVnV2dsMFkvTmJwdjlpcjFr?=
 =?utf-8?B?ellSdFNTeDV2NjhmbmlERHFPa01IWS9WVWd4SGJ4dzUyY2NabDdab3JlM0oz?=
 =?utf-8?B?dUtoMTVvQTNRY0JSME9XMzE3YTB3L25NaGhsTjVwaWxyUlNvRExqY2hqU2F6?=
 =?utf-8?Q?jPb1Jkr9nLD1VU0H0+2szoI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czRmb1ErN1dlK2cxTXBkLzN3SnR1d1NjSTBGN0VOVG5uNjhDQWplTEFJRWRj?=
 =?utf-8?B?cHluYU9mMGdvV2gwazYyTER3VWhLc0VsTHBOakNpRGEvV2JobC9VdDFtZUhG?=
 =?utf-8?B?dmhIeFYvdDh4ZDlzQXB4QUxScHAyVjZObEhENXIwNXFMOGdSdUN3aDd6R1pK?=
 =?utf-8?B?a0NmQ3VpRkZLeStCZkhGdjZBendRLzdRZmVQeVVXVDQ5RC9hOUNTeDQ5L2R4?=
 =?utf-8?B?THBzY0pmS3FmMVlmYThVeE5aTC9qN1VkSDBadnVqdk1hK0YwMFpoeFhiNG0v?=
 =?utf-8?B?Y3dsMkthd2hWVnY1TnErVU9IL2k1ODlIL1Q0MnJVaWw3cmkrM0RhMTFoaEZI?=
 =?utf-8?B?elpnbUw3b0lUN2RDVGFHMVZmR0hzK0NzNTUxOTkvWXJINzhZY2g1YkJOUFdS?=
 =?utf-8?B?V3FLemMxT3JmQlJjcjZTSFF0SVZuQTZ6UUd1LzBpSlhVV0puVENyVE84d0Ux?=
 =?utf-8?B?VmUrZGlna3pkOHFROWhZcXB1d3N6UHhIa0tHMGQrODB4cDN3dHl6L3hITjdN?=
 =?utf-8?B?Vy9CbFdyNDc2QTNYVHBjUjRCOGw1YWtJZFdzTEFiL284LzZJbFlvOFNaNWtI?=
 =?utf-8?B?bENKYlBHWGEwU2RCRnJVSzk4UHNISEhOMW5CYllUbDJjTGhKbDNDL0pOL0hV?=
 =?utf-8?B?aUVoNlM0Qk5nK1NLYjI5ZE96UkV0QjU5TldwRk12N1Z6dzVlWjE4cEVOditI?=
 =?utf-8?B?M3JMQVpieXVlSmZ1WjhTVVlCa2h2Z1BzL280TjZDL0tkazl2b0RPSlF4QVUy?=
 =?utf-8?B?d05wdHQ4bEQvdUZGRjdLVS9MTGk0ZTZRQ3IzWXhaamFraHI3WnY5N041OGk3?=
 =?utf-8?B?bDUyR1FLMXlaRi91cFc3NjJvRjZNaVNHZkVWdmNGWU5NUU9uT1d3K3ZLNmtk?=
 =?utf-8?B?QVNLVjVnZ3RmcWRacHVEY1VPUWg5TkR2K0JtMnZQWTV2WkJUSk4wblZpM1U2?=
 =?utf-8?B?MHIyWUUzbHlUb1kyNGw3ZGNKQWlCQWVzcmdKMmxzNnR2MmpSL0xmS0NHaXQy?=
 =?utf-8?B?N0VQOUFGaS9MeEdOai9kTFZUaUpsRjVOUGx0NmE4TjlXMkxQY21haEl5K00x?=
 =?utf-8?B?Qm5TMW5PUkRYYWpPUkZFQ0lDZXFDbkFITDcwWlNMT29RaXJSMUtBakNWZ2V4?=
 =?utf-8?B?dExwYWM3YzRQT3NESDA1QlNHS0k2OFIxVEV3U1hZSyszVDJsbS9ybkpNZENS?=
 =?utf-8?B?OW9ibGRXMDZWc2pNcnoxdWdwWEZZSVhOZStNT3E2dXRNaWVDZmV4WVFjTThQ?=
 =?utf-8?B?MlBpYXpFWnJkUzFqN1lMbGdjc2RJNlZ1anZQRlB0R1hjTkhWc29vSlgrb2Rp?=
 =?utf-8?B?VjFTWEpvMG9neFJsdkFodjIrWnpJYUM1VmlVNDRGOWlkUEFFMnlDV2Y0Q25n?=
 =?utf-8?B?MlVxVTdwaGNjZjd0Tnp4Z2RHQ0NZalRVTmlwR05ja01YZ21ZRU5CeVE5REdy?=
 =?utf-8?B?TVBnaUpOaHBnWmhxSjZ1blp2M2w1bTc3a3FFOHg5QXcyZWovaWtpak5ZbXBB?=
 =?utf-8?B?Y3ZFT3hBRnk1ZFNndU9yUmhuMTBoZFZaUVdIckhHdkliZjR0NDFBU3hzUHBl?=
 =?utf-8?B?TWpDS0pVM2ZVM0F1MDJaSzgyMDY5NWd3Z3BIMTdLS1hJbnZKenlYSTlsdzJ4?=
 =?utf-8?B?TkNKU0U3bzVmVDNPM3VWblFYNCtsaHlHaTRGMytuSmlET21CdjhrUy9GMDB6?=
 =?utf-8?B?dGsvemU0M2tzU3RUZUVPQjRJdWhhSHFvS0pWRHdVNkp2ME9wUVc1azB5Vmcy?=
 =?utf-8?B?N01uT0RPYTBRSC9wcTA5V3ptS3R0bG1maktleHJDZkVTcDdPdWlaSG5CcW9O?=
 =?utf-8?B?YzduOGZwM2hVYW5NaGlGY3VZbS9Gck1vRmNwSEVwaE9yM2xWdjNKQlNib3A1?=
 =?utf-8?B?SDJ6WmIzeDk3bU43cXJxMGVhNlR4U1IrWFlsd0R1YVczb1A5eFhTbHU2QUtn?=
 =?utf-8?B?NGZkYk01dE0ybTdaWFRIc3RFMUV1RXg4UXg4RnJXS1lRWmpEOWNQdmp2ZGp1?=
 =?utf-8?B?WS9BREprMEkxVXR4dVFjU1dlV1NMck40enB0bER1K1FqNFoxR3JsMFg0QSt1?=
 =?utf-8?B?TGFOVUxXdlpoZ2pTd043WGYwNzEyWld0R1hnVERIUWs5cDBIeGhlUUxsU0Ja?=
 =?utf-8?B?NTA0OUFTaUxNWGJoWDB3ZnQ3SW8xVUdZKzRCcWJJTVBGWnlzYS9hQXNhS0tC?=
 =?utf-8?B?ekxET2dxRWhUSDllZjVhcWlzbWE0dVZDYXhnaVUxWGR3MklzT2p0R0Y5bWcv?=
 =?utf-8?B?UW5FcExJaWk1dU55YVJROXZaMC8rWjhGL3NXSjdkWFJWSjZMblhLK3RsSWsx?=
 =?utf-8?B?ZGZKVDd2K0pzWnFPRnlPRGRtblpPNnhtZXlYVFNHOXBDSWhVNW1uUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5211fd-b621-4801-b37b-08de7294115e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 04:29:00.4734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DW91l+FWzG5Xs9a4rQkkYR00hlEzByFFPzdvmj2RJMbuoF1OgIFeuAysmg51v1CY/9cUbjIyUsqGFxnMoWqMfCFaJD3zHlinNOlrktwPOj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6085
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWWFkYXYsIEFydmluZCA8
YXJ2aW5kLnlhZGF2QGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgMTcgRmVicnVhcnksIDIw
MjYgMDg6MDQgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBC
cm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBHaGltaXJheSwgSGltYWwg
UHJhc2FkDQo+IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPjsgdGhvbWFzLmhlbGxz
dHJvbUBsaW51eC5pbnRlbC5jb207DQo+IFNoYXJtYSwgTmlzaGl0IDxuaXNoaXQuc2hhcm1hQGlu
dGVsLmNvbT47IEd1cnJhbSwgUHJhdmFsaWthDQo+IDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNv
bT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYzIDEvOF0gZHJtLXVhcGkveGVfZHJtOiBBZGQg
VUFQSSBzdXBwb3J0IGZvcg0KPiBwdXJnZWFibGUgYnVmZmVyIG9iamVjdHMNCj4gDQo+IEZyb206
IEhpbWFsIFByYXNhZCBHaGltaXJheSA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4N
Cj4gDQo+IEV4dGVuZCB0aGUgRFJNX1hFX01BRFZJU0UgaW9jdGwgdG8gc3VwcG9ydCBwdXJnZWFi
bGUgYnVmZmVyIG9iamVjdA0KPiBtYW5hZ2VtZW50IGJ5IGFkZGluZyBEUk1fWEVfVk1BX0FUVFJf
UFVSR0VBQkxFX1NUQVRFIGF0dHJpYnV0ZQ0KPiB0eXBlLg0KPiANCj4gVGhpcyBhbGxvd3MgdXNl
cnNwYWNlIGFwcGxpY2F0aW9ucyB0byBwcm92aWRlIG1lbW9yeSB1c2FnZSBoaW50cyB0byB0aGUN
Cj4ga2VybmVsIGZvciBiZXR0ZXIgbWVtb3J5IG1hbmFnZW1lbnQgdW5kZXIgcHJlc3N1cmU6DQo+
IA0KPiBUaGlzIGFsbG93cyB1c2Vyc3BhY2UgYXBwbGljYXRpb25zIHRvIHByb3ZpZGUgbWVtb3J5
IHVzYWdlIGhpbnRzIHRvIHRoZQ0KPiBrZXJuZWwgZm9yIGJldHRlciBtZW1vcnkgbWFuYWdlbWVu
dCB1bmRlciBwcmVzc3VyZToNCj4gDQo+IC0gV0lMTE5FRUQ6IEJ1ZmZlciBpcyBuZWVkZWQgYW5k
IHNob3VsZCBub3QgYmUgcHVyZ2VkLiBJZiB0aGUgQk8gd2FzDQo+ICAgcHJldmlvdXNseSBwdXJn
ZWQsIHJldGFpbmVkIGZpZWxkIHJldHVybnMgMCBpbmRpY2F0aW5nIGJhY2tpbmcgc3RvcmUNCj4g
ICB3YXMgbG9zdCAob25jZSBwdXJnZWQsIGFsd2F5cyBwdXJnZWQgc2VtYW50aWNzIG1hdGNoaW5n
IGk5MTUpLg0KPiANCj4gLSBET05UTkVFRDogQnVmZmVyIGlzIG5vdCBjdXJyZW50bHkgbmVlZGVk
IGFuZCBtYXkgYmUgcHVyZ2VkIGJ5IHRoZQ0KPiAgIGtlcm5lbCB1bmRlciBtZW1vcnkgcHJlc3N1
cmUgdG8gZnJlZSByZXNvdXJjZXMuIE9ubHkgYXBwbGllcyB0bw0KPiAgIG5vbi1zaGFyZWQgQk9z
Lg0KPiANCj4gVGhlIGltcGxlbWVudGF0aW9uIGluY2x1ZGVzIGEgJ3JldGFpbmVkJyBvdXRwdXQg
ZmllbGQgKG1hdGNoaW5nIGk5MTUncw0KPiBkcm1faTkxNV9nZW1fbWFkdmlzZS5yZXRhaW5lZCkg
dGhhdCBpbmRpY2F0ZXMgd2hldGhlciB0aGUgQk8ncyBiYWNraW5nDQo+IHN0b3JlIHN0aWxsIGV4
aXN0cyAoMSkgb3IgaGFzIGJlZW4gcHVyZ2VkICgwKS4NCj4gDQo+IHYyOg0KPiAgIC0gVXBkYXRl
IFVBUEkgZG9jdW1lbnRhdGlvbiB0byBjbGFyaWZ5IHJldGFpbmVkIG11c3QgYmUgaW5pdGlhbGl6
ZWQNCj4gICAgIHRvIDAoVGhvbWFzKQ0KPiANCj4gQ2M6IE5pc2hpdCBTaGFybWEgPG5pc2hpdC5z
aGFybWFAaW50ZWwuY29tPg0KPiBDYzogUHJhdmFsaWthIEd1cnJhbSA8cHJhdmFsaWthLmd1cnJh
bUBpbnRlbC5jb20+DQo+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNv
bT4NCj4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVs
LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSGltYWwgUHJhc2FkIEdoaW1pcmF5IDxoaW1hbC5wcmFz
YWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBcnZpbmQgWWFkYXYgPGFy
dmluZC55YWRhdkBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgaW5jbHVkZS9kcm0tdWFwaS94ZV9kcm0u
aCB8IDQ0DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBm
aWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2RybS11YXBpL3hlX2RybS5oIGIvaW5jbHVkZS9kcm0tdWFwaS94ZV9kcm0uaCBpbmRleA0KPiAw
NzdlNjZhNjguLjNkZDFiYTg3NSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0tdWFwaS94ZV9k
cm0uaA0KPiArKysgYi9pbmNsdWRlL2RybS11YXBpL3hlX2RybS5oDQo+IEBAIC0yMDk5LDYgKzIw
OTksNyBAQCBzdHJ1Y3QgZHJtX3hlX21hZHZpc2Ugew0KPiAgI2RlZmluZSBEUk1fWEVfTUVNX1JB
TkdFX0FUVFJfUFJFRkVSUkVEX0xPQwkwDQo+ICAjZGVmaW5lIERSTV9YRV9NRU1fUkFOR0VfQVRU
Ul9BVE9NSUMJCTENCj4gICNkZWZpbmUgRFJNX1hFX01FTV9SQU5HRV9BVFRSX1BBVAkJMg0KPiAr
I2RlZmluZSBEUk1fWEVfVk1BX0FUVFJfUFVSR0VBQkxFX1NUQVRFCQkzDQo+ICAJLyoqIEB0eXBl
OiB0eXBlIG9mIGF0dHJpYnV0ZSAqLw0KPiAgCV9fdTMyIHR5cGU7DQo+IA0KPiBAQCAtMjE4OSw2
ICsyMTkwLDQ5IEBAIHN0cnVjdCBkcm1feGVfbWFkdmlzZSB7DQo+ICAJCQkvKiogQHBhdF9pbmRl
eC5yZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4gIAkJCV9fdTY0IHJlc2VydmVkOw0KPiAgCQl9IHBh
dF9pbmRleDsNCj4gKw0KPiArCQkvKioNCj4gKwkJICogQHB1cmdlX3N0YXRlX3ZhbDogUHVyZ2Vh
YmxlIHN0YXRlIGNvbmZpZ3VyYXRpb24NCj4gKwkJICoNCj4gKwkJICogVXNlZCB3aGVuIEB0eXBl
ID09DQo+IERSTV9YRV9WTUFfQVRUUl9QVVJHRUFCTEVfU1RBVEUuDQo+ICsJCSAqDQo+ICsJCSAq
IENvbmZpZ3VyZXMgdGhlIHB1cmdlYWJsZSBzdGF0ZSBvZiBidWZmZXIgb2JqZWN0cyBpbiB0aGUN
Cj4gc3BlY2lmaWVkDQo+ICsJCSAqIHZpcnR1YWwgYWRkcmVzcyByYW5nZS4gVGhpcyBhbGxvd3Mg
YXBwbGljYXRpb25zIHRvIGhpbnQgdG8gdGhlDQo+IGtlcm5lbA0KPiArCQkgKiBhYm91dCBibydz
IHVzYWdlIHBhdHRlcm5zIGZvciBiZXR0ZXIgbWVtb3J5IG1hbmFnZW1lbnQuDQo+ICsJCSAqDQo+
ICsJCSAqIFN1cHBvcnRlZCB2YWx1ZXMgZm9yIEBwdXJnZV9zdGF0ZV92YWwudmFsOg0KPiArCQkg
KiAgLSBEUk1fWEVfVk1BX1BVUkdFQUJMRV9TVEFURV9XSUxMTkVFRCAoMCk6IE1hcmtzDQo+IEJP
IGFzIG5lZWRlZC4NCj4gKwkJICogICAgSWYgQk8gd2FzIHB1cmdlZCwgcmV0dXJucyByZXRhaW5l
ZD0wIChiYWNraW5nIHN0b3JlIGxvc3QpLg0KPiArCQkgKg0KPiArCQkgKiAgLSBEUk1fWEVfVk1B
X1BVUkdFQUJMRV9TVEFURV9ET05UTkVFRCAoMSk6IEhpbnRzDQo+IHRoYXQgQk8gaXMgbm90DQo+
ICsJCSAqICAgIGN1cnJlbnRseSBuZWVkZWQuIEtlcm5lbCBtYXkgcHVyZ2UgaXQgdW5kZXIgbWVt
b3J5DQo+IHByZXNzdXJlLg0KPiArCQkgKiAgICBPbmx5IGFwcGxpZXMgdG8gbm9uLXNoYXJlZCBC
T3MuIFJldHVybnMgcmV0YWluZWQ9MSBpZiBub3QNCj4gcHVyZ2VkLg0KPiArCQkgKi8NCj4gKwkJ
c3RydWN0IHsNCj4gKyNkZWZpbmUgRFJNX1hFX1ZNQV9QVVJHRUFCTEVfU1RBVEVfV0lMTE5FRUQJ
MA0KPiArI2RlZmluZSBEUk1fWEVfVk1BX1BVUkdFQUJMRV9TVEFURV9ET05UTkVFRAkxDQo+ICsJ
CQkvKiogQHB1cmdlX3N0YXRlX3ZhbC52YWw6IHZhbHVlIGZvcg0KPiBEUk1fWEVfVk1BX0FUVFJf
UFVSR0VBQkxFX1NUQVRFICovDQo+ICsJCQlfX3UzMiB2YWw7DQo+ICsNCj4gKwkJCS8qIEBwdXJn
ZV9zdGF0ZV92YWwucGFkICovDQo+ICsJCQlfX3UzMiBwYWQ7DQo+ICsJCQkvKioNCj4gKwkJCSAq
IEBwdXJnZV9zdGF0ZV92YWwucmV0YWluZWQ6IFBvaW50ZXIgdG8gb3V0cHV0IGZpZWxkDQo+IGZv
ciBiYWNraW5nDQo+ICsJCQkgKiBzdG9yZSBzdGF0dXMuDQo+ICsJCQkgKg0KPiArCQkJICogVXNl
cnNwYWNlIG11c3QgaW5pdGlhbGl6ZSB0aGlzIHUzMiBmaWVsZCB0byAwIGJlZm9yZQ0KPiB0aGUN
Cj4gKwkJCSAqIGlvY3RsLiBLZXJuZWwgd3JpdGVzIHRvIGl0IGFmdGVyIHRoZSBvcGVyYXRpb246
DQo+ICsJCQkgKiAtIDEgaWYgYmFja2luZyBzdG9yZSBleGlzdHMgKG5vdCBwdXJnZWQpDQo+ICsJ
CQkgKiAtIDAgaWYgYmFja2luZyBzdG9yZSB3YXMgcHVyZ2VkDQo+ICsJCQkgKg0KPiArCQkJICog
SWYgdXNlcnNwYWNlIGZhaWxzIHRvIGluaXRpYWxpemUgdG8gMCwgaW9jdGwgcmV0dXJucyAtDQo+
IEVJTlZBTC4NCj4gKwkJCSAqIFRoaXMgZW5zdXJlcyBhIHNhZmUgZGVmYXVsdCAoMCA9IGFzc3Vt
ZSBwdXJnZWQpIGlmDQo+IGtlcm5lbA0KPiArCQkJICogY2Fubm90IHdyaXRlIHRoZSByZXN1bHQu
DQo+ICsJCQkgKg0KPiArCQkJICogU2ltaWxhciB0byBpOTE1J3MgZHJtX2k5MTVfZ2VtX21hZHZp
c2UucmV0YWluZWQNCj4gZmllbGQuDQo+ICsJCQkgKi8NCj4gKwkJCV9fdTY0IHJldGFpbmVkOw0K
PiArCQl9IHB1cmdlX3N0YXRlX3ZhbDsNCj4gIAl9Ow0KQXMga2FtaWwgc3VnZ2VzdGVkIHBsZWFz
ZSBtYWtlIHN1cmUgdGhhdCBpdOKAmXMgYSBjb3B5IG9mIGtlcm5lbA0KUmV2aWV3ZWQtYnk6IFBy
YXZhbGlrYSBHdXJyYW0gPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiANCj4gIAkvKiog
QHJlc2VydmVkOiBSZXNlcnZlZCAqLw0KPiAtLQ0KPiAyLjQzLjANCg0K
