Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F41CCD185
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 07:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D27D10E101;
	Wed, 18 Sep 2024 07:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WbmPUy9y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE99210E101
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 07:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726644957; x=1758180957;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=NkRkPQVh+uYzs/ILsVEEydFSgr1Xmx1GYMwBN38MGHE=;
 b=WbmPUy9yblBaHt2h8tN91B0sb0/CBLjIgLAbADfRODaLclzAN6KU6Avr
 eZcCfHPtAJ8A0Pjb9TXU3War1A3X812ZEWF+ShqlsIhJ4F/ZcK0vB7iCE
 sxXj7im8paEn14x+siuYPKph7JeuNrVYDj3b0LpH2PybSBuukcPVnxHOq
 PMpvkZ4Cu1BFkPx9gCYoiJosqQySwyioYLakTMSWYlC+Vjg4xegBJpZYX
 vmm3nwhFEAd0xAvcK5G8voIks+4TlJ3PsJ8dGpyem/0VnDwdDENf2+TmI
 RYkiPAm/OHr6x+qKamqOhIOJ1VFgD3GI/KKGbQrSfENrA52uKFlOyXGDd A==;
X-CSE-ConnectionGUID: EsvTdWxQQh6yYcihKKFe9g==
X-CSE-MsgGUID: f+8Ecm8ESYiS/jtc3WK/nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="43059953"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="43059953"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 00:35:57 -0700
X-CSE-ConnectionGUID: YfJcc78WQ5GlAeD4QkTgPg==
X-CSE-MsgGUID: xXiHNpZ9QWibbEbRLXoCyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69074336"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 00:35:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 00:35:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 00:35:56 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 00:35:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovi/NAoiAIUxIIZy9lxkde4cyH53B/cUjk1DGHXiXuPeURKSLU6F5KYrDqDf8vqU6Q3nz9N8elVkTTiPp2N+8SB1mdyxLackv3zZZEtExXUhKlhtj/xFBPMJNZrc+OiCN790iPVsfFJP4ndd8fdAzlpggYN8jSNSZFwXtbekfSQDx2dOCja2xSQGbD4Oslj/vq2uVvYIjtMhcwn1c0tnnoTZKfBV76RHJ59snN22CvhXA9bnCzmZPl3qjerGgnWQqmcazbxZ8PCC6SH18jxflWvHub68MWWsbE1vzftkA1+LAFeKn54WJkIv+ZxHX5/Ts7crTdSqsNpO9m5QiqS+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkRkPQVh+uYzs/ILsVEEydFSgr1Xmx1GYMwBN38MGHE=;
 b=TICURuCVXPUwh92QruJ7AkZyLZ3YTbKFrq0ECvPMxwe2W75PdFc3mfnQzPTzkoeOqm4UQYoCR/k3F4VXsXa2doqN3fujdWIlMQwAmsPQPDqOOxyZk19EqeX/Uob6nrr8xqyEFncoLQCjlrPtFnKeyoofJsgujnBY1kY66JhB3yZDHNho/uoj8tUFr1nDOaRLOxVvaRE4HWR53QxR8gqUcGrodjpJAp5if77BBVD3+SSH+7RKm7yGUeH0d33esJp01gXKKgvfzRJaOf9cMPBVw81aReHHj1zSClAmT603IM2ZsJwcHg15VyElRkESmhC5EeyQ9yFT/drqyttAsc+fYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH7PR11MB5796.namprd11.prod.outlook.com (2603:10b6:510:13b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 07:35:52 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 07:35:52 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH i-g-t v3 1/2] lib/igt_psr: Remove SRD status change check
 for DP2.1 Panel Replay
Thread-Topic: [PATCH i-g-t v3 1/2] lib/igt_psr: Remove SRD status change check
 for DP2.1 Panel Replay
Thread-Index: AQHbBIiqBs7vngY+00uMcgEvepcfTLJdMbSA
Date: Wed, 18 Sep 2024 07:35:52 +0000
Message-ID: <75aa7c5546f040e55b2a0116d31d07a62b156794.camel@intel.com>
References: <20240911202408.1665929-1-ramanaidu.naladala@intel.com>
 <20240911202408.1665929-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20240911202408.1665929-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH7PR11MB5796:EE_
x-ms-office365-filtering-correlation-id: 53614135-644d-4595-0986-08dcd7b48619
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RUFJWXpVR3ZiejdLU0ZXOGs1TEdCU1FiVXRpUEM4Wmhra2lrMzB3VXhuV0pO?=
 =?utf-8?B?c3NHRG9HUW5LSTh5Wk9BMVRSS2d5SEtqd1QxYWRLd3YrZ2JuVjA0YXVLcjBK?=
 =?utf-8?B?MmhNTDlGeUVyaGtoV3E0VStjSm9BNzEvZ0ZYYnZWU0xjUGdQeEkwV2Nyc0tY?=
 =?utf-8?B?V0RQZC9SN05IaExmbEJXK28rbWd2ZzlNRlhSa3YzMUJkY3MyNEltZGVYMFFr?=
 =?utf-8?B?TlZESmFUZXA1MXhISk03RHM2NDNrM3M3VWlNMEMxaGdGSTdLUnNlL3RHZjg5?=
 =?utf-8?B?eTV3QWZJdUtMaCsvME9NVThTaERHajFZa3Z6cXdmRXFFT3NSR282MjByRFVW?=
 =?utf-8?B?MDRwN2ZteWFVMlJ3Wk9tOWttOXlEc2ZMRTdLZU02ZUc1Z3J5aDNoTHNMQjk3?=
 =?utf-8?B?YnpCNFJjaEpKVmJPTFdlWmdEVEJpZEVVQWY0YnR0Q0lpRXpzMWI0eXluN0lQ?=
 =?utf-8?B?RFN4dnk3M3lSRWpySEZXdEhObmkxbTFQUUcxQnVnbFJYZ05pRmVaNXY0Q0xw?=
 =?utf-8?B?cGdXcDNBbi83RUtiMDlESHdjNjVkdEZZaXZwL0ROMllNNGJQaklVcmMrLy9O?=
 =?utf-8?B?dUtya0VWRzJWZVVLZ1MzNGZmYU95L2RqcGhTQ3pmOHpLNkRGcjZCM1g2OFJ3?=
 =?utf-8?B?MXlZd0NLcXhZNVc2akdZMitlbUFTWk9ob25KTnJEUE5mYzB2MFNndFhpK0xh?=
 =?utf-8?B?U0pWVnNyZlZ1N0RmUjRkMDRvZ0hQMkVCNzh4T1cwQ2VrQnk2em15WU5aNTZx?=
 =?utf-8?B?b0JHSE9UWGY5QWNpYmVJMHZ1ekJYYTJyNzkzanN4NlRjaUxQRTJwbHVQNHhx?=
 =?utf-8?B?a3lJcDhBRGxseXJ0cUpaYW9pSW5DZ3RWc0tlZkZWUUZINXRpckZmQjduRU5s?=
 =?utf-8?B?dHRzMHpTNUxHakNIQ1ZZb05FZjF6VzZuQWRid1Vrem01VGlpMzdWcFd4dW1V?=
 =?utf-8?B?L2xiT3lKKzAyaXg1aUt1cmYxMFQvLzcybnZaZGVMR3k1WGVkK3A1Z0QzdUJi?=
 =?utf-8?B?S0tIOHpmeWlFaTF1N292czhRbWhCeDZUWjJXVG5nVXJVOHVBalNNNVRXVTlw?=
 =?utf-8?B?b0hGTzBBbmJRWS9IcytxUXVtQ2tqLy85RkcvNWJmZHFuUnNEVUZybzlRSzJp?=
 =?utf-8?B?SmRKNGx2SmVRb3BjTUtDd29YaERKeXQzVFFmZVNwWHBsZXA4Q3dJc1ZEaUpQ?=
 =?utf-8?B?TzlwY3o3amxROVlWbVUvdmhvVGtTWWsvL2pGczI1dSswaUo5T3IxTzNTRUlW?=
 =?utf-8?B?Mk4zZ3dRS2FFclhqWldsUnowdkFSVFZSSTNlZWxLc2FRRFJaR2J4ZTZvSzZQ?=
 =?utf-8?B?UTYzRTl4TVlVSWJna1Nxa0paRVliM0ZraGRqQXJxeWZ1RjRCV2RFRFY5WGU1?=
 =?utf-8?B?dUlvQXB1RjdleEtsZnljZUp5amdYR2U0MVgvV2c5ZTdLWkVnWHFOZ3JDRW9k?=
 =?utf-8?B?SHprT2h2dzVQWlgwSTczV3UybVZqZ3E2bHpVQWxpWitRMzlydTZ5ZExmWG5L?=
 =?utf-8?B?UDdRNGlyTDk0ekgyN0RlY0V5WGk2YUJHcy9ReHlYeHc5Z1IyTTRmVGNpeHBa?=
 =?utf-8?B?NWQvMFA4b00xcFdycUhkdHF5cVRpb0QwZjZHMnlsSm9mOUsxVjBkWGlCUU85?=
 =?utf-8?B?czlIQ1VPWUNFSnZyb05xcUsreithVUl2Y2luV1YzdVZJcXFxcTRObnVBcFRC?=
 =?utf-8?B?RHBma21vdjBZT1lJNW1qb1pRTUd1ZXNQcEJpY09FWTBTc2Ztc04wbzF4WTNm?=
 =?utf-8?B?ZWxYcmlOemY4ODJjT0psc3BUbEM4THRKTnlWMnF2bytLLzJwdGpxa1ZFOVlX?=
 =?utf-8?B?U3o0TVhENlQ5ME1xMzlZMHJvdGhmTm9zTmdGS2RjNXFwZDBtRlhyUlNCN2Na?=
 =?utf-8?B?RDN0NUhqK2JTWWE2VzlwRU5ld1RZaFJWKzBkaE90VXdHb3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGRSaytvSUNPajBDSGxRVFNhbE5nSGNtWXlTOFNBUVdyV3ZYRWVGbVMvQzlk?=
 =?utf-8?B?aHFacnZTZkx5b0NTekNsZjRZSFpCR2txbGsxaTliMGE1ZS96dUhqRnVXRWc4?=
 =?utf-8?B?SWoxMVJFUFpxOEN0WW0waUF4R1lyY1RrT3ZQVlRPeUhLcm43VWg0Q2g5aDFD?=
 =?utf-8?B?Sjg5VEwvUFRhZDZjcGtlMFNJZ1M1QU5IQ0pmQmRjaHhRMWtLT21MdzFZVE90?=
 =?utf-8?B?dWRiOC9wek1OWlZYRC9LNEo4M29PMmZGZ1pUbldSVWVhZDl3ellMVU14YkYw?=
 =?utf-8?B?aXZLYUJXTW9DTXVBcFVkYmNkeWNUblN5QXRoZ0lLT2dpTFptaW1KRzRlSUYx?=
 =?utf-8?B?dFVvN2xiVlFxV0xLVSs5SStMNnpoZmdIWEN1aFhFWFgzR0lvRE1XQ0ViazdK?=
 =?utf-8?B?SW93Y2MvMDd1SzR4NzFsa04xVzFZaGpyRmhQd3VJeFMxNEJhQTJDVFl1bzVH?=
 =?utf-8?B?Z1FVU3c1TFJuRDNLOExsYzc0NTVOUERQUGYvSmNIL3lGc3d2d3pBYlFuRXE1?=
 =?utf-8?B?S1ZFSk5COHlEN1pvWnB1UVRMTFcyeHoyWmJTWXoxL3pqNVVjYlU5MkdYd0Nm?=
 =?utf-8?B?ZFpJTCt5ZHRHMDhEYnpWbW5tdE9KdG51alZ4M0hyWTNkUWRSNjlvWnlUZ2lW?=
 =?utf-8?B?Z0g4Y1BsQUNJanRoTEc5RWE5WTVsSWZ0ck02N2hwN2tCMmxHcFVBTzJhaGZJ?=
 =?utf-8?B?bFkwRDZSdVVJbDlIU05vQUI2N2dsMlIwVW1aZW5OT1kzanlaQUtNbnZhSU41?=
 =?utf-8?B?Qk85RjZzV3FabmZoUCtpUTcrZzNNTnA2cHcrQTdsR253ZzMzaGZYc2VjMmtq?=
 =?utf-8?B?WldFZU80dkZJc2crUk1PZFNrREpWVlJaWTdCWWw1eVM5S3BEeXpsY0lya1d0?=
 =?utf-8?B?RWlza2x0U0I1akhJdnhiZ0xYOSsrempLaTR5OGJWOUxGeVo0ZnpwN1VzVVlJ?=
 =?utf-8?B?TFR4RG52WCtrem1DanloTGFmZnQxSTRKdkE5R01WR1hmWFREb1FEMm1TcmFp?=
 =?utf-8?B?RHJUYTRTd1IwbGNSY3JIRGJYM3BZeWgrUUlFdURVYjl4ayt0UFZSV0FmMGlk?=
 =?utf-8?B?V0JSM0JUVngzcUdVdTZDYTNuaFk1WkwvcGZaTmVqc0s4Y0pEb2R6NXVmdWJ2?=
 =?utf-8?B?TUFHeHhaTzlTTERJLzFXanpYVHJHbVExenAxdUkyZk42YXZyNE5XUnlHbXBS?=
 =?utf-8?B?OTJWeXJaelNaa0xnZWtsYW9tc1ZETG5MRUhDZjJJZ1pDUE4zQ3Jpc1l0KzR1?=
 =?utf-8?B?RFhXSUt4NzFPaWo2YUtHMHlHTEpMY1ZPeW42Q29CbnQwQ3NuU1FrbGZQZmE0?=
 =?utf-8?B?SmFCMUJVTWZpSk9wdmcrajJRNmJ1RnNaaFNiM2FIdGpReFZZTFdzQTJJeGF0?=
 =?utf-8?B?OWFnaVdTbTM2M0szalRZS2xTeUVKSlNDYktNS0tYSEtJVDNrUWVCRmZNTVVI?=
 =?utf-8?B?dXdWbE5MNlZZaTVQMUVDMTRLQ0NHY003MjRac2I5bFU4UHhlMXhZejZlcGo4?=
 =?utf-8?B?YUNvczY4eTQ1SHNVbC9kU080dHhKU05aVFJPN2krTFMzeFhpY29GWFo5RHhD?=
 =?utf-8?B?dmFyUVlXTEJXYmtWOHArRlRmY2l2MXNNc3JpQ2EzbHl2eUwxUlNnQmp2dStV?=
 =?utf-8?B?bHFCOENRTkkvbE9RUlkvcDdtNDVIaDFIdWwyczJ0QnpGMEE1T1hKekM5Q3Rm?=
 =?utf-8?B?ZTROcXI0QXJvbEE5S2xRaEpJcXV4K3RubHQrbkRCUFB0aE80N0lzYkRENmdH?=
 =?utf-8?B?N09GY3JiUG1WM0Y4NjdtZUJxTlBNY2VQZ3hRa2tidE5saytKbUNrblIyUG0x?=
 =?utf-8?B?azJ3dWVxWkxGbXNLQ3JBckltMWU0NG10WEJINXZUYXJUTDhoRC8rTncvNjIr?=
 =?utf-8?B?b1R5d0c1ek9yOG9KQmVLdkRiR2dYK3ZTTS9wbDh4bHdwcWE2eG5iaUR1SGNy?=
 =?utf-8?B?T3RzUmNKbFk3NXBJdllxVUl1Y2llRUtQTHB0ZWVKL3kyQVdqV3FJajBsM2Jv?=
 =?utf-8?B?UlhtZTRnZFJEK1kxUEt3SVBycXZiQTdXUlRTWlN0V1RwY041bElBaWMyV3V3?=
 =?utf-8?B?UnY3VGgvazVxblhkUHFWZUtUSE9wZXByTG02NXo5OWM4eVRGaDZRZ25nV054?=
 =?utf-8?B?RDNjZlh5Y255TlYzZzV1bzdobjRrR2NMUHJNN2JmUkdWWlBOc1IxNDYvYXQ3?=
 =?utf-8?B?Q2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B5278F9797718488C433C647282ACB2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53614135-644d-4595-0986-08dcd7b48619
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 07:35:52.3579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VC+l3MdPsN49RkMbVPqTg8adtxpC7tlOT2jgWRxIjnIjwdE4S7GT3U/6lHQFZhQWVsKdg3IwY1AElt3DBQJDLJOFwyKWsn8g+i4SaJ8oOjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5796
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

T24gVGh1LCAyMDI0LTA5LTEyIGF0IDAxOjU0ICswNTMwLCBOYWxhZGFsYSBSYW1hbmFpZHUgd3Jv
dGU6DQo+IFdlIGRvIG5vdCBoYXZlIEFMUE0gb24gdGhlIERQMi4xIFBhbmVsIFJlcGxheS4gRHVl
IHRvIHRoaXMsIHRoZQ0KPiBTUkRfU1RBVFVTIFtTUkQgU3RhdGVdIGRvZXNuJ3QgY2hhbmdlIGZy
b20gU1JERU5UX09OIGFmdGVyIFBhbmVsDQo+IFJlcGxheSBpcyBlbmFibGVkIHVudGlsIGl0IGdl
dHMgZGlzYWJsZWQuIEFzIGEgcmVzdWx0LCB0aGUgaWd0DQo+IHRlc3RzIGZhaWwuIFRvIHJlc29s
dmUgdGhpcyBpc3N1ZSwgYWRkIGEgY29uZGl0aW9uIHRvIHNraXAgdGhlDQo+IGNoZWNrIGluIHRo
ZSAncHNyX3dhaXRfdXBkYXRlJyBhbmQgJ3Bzcl9sb25nX3dhaXRfdXBkYXRlJw0KPiBmdW5jdGlv
bnMgZm9yIERQMi4xIFBSLg0KPiANCj4gdjE6IFVwZGF0ZSBjaGFuZ2UgZm9yIGFsbCB1c2VycyBv
ZiBwc3Jfd2FpdF91cGRhdGUgYW5kDQo+IMKgwqDCoCBwc3JfbG9uZ193YWl0X3VwZGF0ZS4gKEpv
dW5pKQ0KPiB2MjogVXBkYXRlIG51bGwgY2hlY2sgaW4gaWYgY29uZGl0aW9uDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBOYWxhZGFsYSBSYW1hbmFpZHUgPHJhbWFuYWlkdS5uYWxhZGFsYUBpbnRlbC5j
b20+DQoNClJldmlld2VkLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVs
LmNvbT4NCg0KPiAtLS0NCj4gwqBsaWIvaWd0X3Bzci5jIHwgMjIgKysrKysrKysrKysrKysrKysr
KystLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfcHNyLmMgYi9saWIvaWd0X3Bzci5jDQo+IGlu
ZGV4IGUzZTc1NzdlYi4uMjIyZTA1ZTZjIDEwMDY0NA0KPiAtLS0gYS9saWIvaWd0X3Bzci5jDQo+
ICsrKyBiL2xpYi9pZ3RfcHNyLmMNCj4gQEAgLTExMywxMiArMTEzLDMwIEBAIGJvb2wgcHNyX3dh
aXRfZW50cnkoaW50IGRlYnVnZnNfZmQsIGVudW0NCj4gcHNyX21vZGUgbW9kZSwgaWd0X291dHB1
dF90ICpvdXRwdXQpDQo+IMKgDQo+IMKgYm9vbCBwc3Jfd2FpdF91cGRhdGUoaW50IGRlYnVnZnNf
ZmQsIGVudW0gcHNyX21vZGUgbW9kZSwNCj4gaWd0X291dHB1dF90ICpvdXRwdXQpDQo+IMKgew0K
PiAtwqDCoMKgwqDCoMKgwqByZXR1cm4gaWd0X3dhaXQoIXBzcl9hY3RpdmVfY2hlY2soZGVidWdm
c19mZCwgbW9kZSwgb3V0cHV0KSwNCj4gNDAsIDEpOw0KPiArwqDCoMKgwqDCoMKgwqAvKg0KPiAr
wqDCoMKgwqDCoMKgwqAgKiBUT0RPOiBBZnRlciBlbmFibGluZyBQYW5lbCBSZXBsYXkgb24gRFAy
LjEsIG9ic2VydmUgdGhhdA0KPiB0aGUgU1JEIHN0YXR1cw0KPiArwqDCoMKgwqDCoMKgwqAgKiBy
ZW1haW5zIGluIHRoZSBTUkRFTlRfT04gc3RhdGUuIFJlbW92ZSB0aGUgcG9sbGluZw0KPiBtZWNo
YW5pc20gZm9yIHRoZSBTUkQNCj4gK8KgwqDCoMKgwqDCoMKgICogc3RhdHVzIGNoYW5nZSBmb3Ig
dGhlIERQMi4xIG91dHB1dC4NCj4gK8KgwqDCoMKgwqDCoMKgICovDQo+ICvCoMKgwqDCoMKgwqDC
oGlmIChvdXRwdXQgIT0gTlVMTCAmJg0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3V0cHV0LT5j
b25maWcuY29ubmVjdG9yLT5jb25uZWN0b3JfdHlwZSA9PQ0KPiBEUk1fTU9ERV9DT05ORUNUT1Jf
RGlzcGxheVBvcnQpDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gaWd0
X3dhaXQocHNyX2FjdGl2ZV9jaGVjayhkZWJ1Z2ZzX2ZkLCBtb2RlLA0KPiBvdXRwdXQpLCA0MCwg
MSk7DQo+ICvCoMKgwqDCoMKgwqDCoGVsc2UNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJldHVybiBpZ3Rfd2FpdCghcHNyX2FjdGl2ZV9jaGVjayhkZWJ1Z2ZzX2ZkLCBtb2RlLA0K
PiBvdXRwdXQpLCA0MCwgMSk7DQo+IMKgfQ0KPiDCoA0KPiDCoGJvb2wgcHNyX2xvbmdfd2FpdF91
cGRhdGUoaW50IGRlYnVnZnNfZmQsIGVudW0gcHNyX21vZGUgbW9kZSwNCj4gaWd0X291dHB1dF90
ICpvdXRwdXQpDQo+IMKgew0KPiAtwqDCoMKgwqDCoMKgwqByZXR1cm4gaWd0X3dhaXQoIXBzcl9h
Y3RpdmVfY2hlY2soZGVidWdmc19mZCwgbW9kZSwgb3V0cHV0KSwNCj4gNTAwLCAxKTsNCj4gK8Kg
wqDCoMKgwqDCoMKgLyoNCj4gK8KgwqDCoMKgwqDCoMKgICogVE9ETzogQWZ0ZXIgZW5hYmxpbmcg
UGFuZWwgUmVwbGF5IG9uIERQMi4xLCBvYnNlcnZlIHRoYXQNCj4gdGhlIFNSRCBzdGF0dXMNCj4g
K8KgwqDCoMKgwqDCoMKgICogcmVtYWlucyBpbiB0aGUgU1JERU5UX09OIHN0YXRlLiBSZW1vdmUg
dGhlIHBvbGxpbmcNCj4gbWVjaGFuaXNtIGZvciB0aGUgU1JEDQo+ICvCoMKgwqDCoMKgwqDCoCAq
IHN0YXR1cyBjaGFuZ2UgZm9yIHRoZSBEUDIuMSBvdXRwdXQuDQo+ICvCoMKgwqDCoMKgwqDCoCAq
Lw0KPiArwqDCoMKgwqDCoMKgwqBpZiAob3V0cHV0ICE9IE5VTEwgJiYNCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgIG91dHB1dC0+Y29uZmlnLmNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0NCj4g
RFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0KQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmV0dXJuIGlndF93YWl0KHBzcl9hY3RpdmVfY2hlY2soZGVidWdmc19mZCwgbW9k
ZSwNCj4gb3V0cHV0KSwgNTAwLCAxKTsNCj4gK8KgwqDCoMKgwqDCoMKgZWxzZQ0KPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGlndF93YWl0KCFwc3JfYWN0aXZlX2NoZWNr
KGRlYnVnZnNfZmQsIG1vZGUsDQo+IG91dHB1dCksIDUwMCwgMSk7DQo+IMKgfQ0KPiDCoA0KPiDC
oHN0YXRpYyBzc2l6ZV90IHBzcl93cml0ZShpbnQgZGVidWdmc19mZCwgY29uc3QgY2hhciAqYnVm
LA0KPiBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkNCg0K
