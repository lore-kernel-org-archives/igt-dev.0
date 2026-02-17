Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918F3E909A3
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 13:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF2210E25E;
	Tue, 17 Feb 2026 13:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WcDN6qK9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE10210E25E
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 13:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771336630; x=1802872630;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=z82zTeuDgpe836/Bz40zHQtmCEmdLupUovSn2OrZgiE=;
 b=WcDN6qK95muk4hlSQ+ndssfqiGJXDlbnOA13gKtXjEUcftLfaOj+gy0z
 yXv1FX/lwFng5wPOxocB3aTv4TVgYkRsIneZ1H6MrzQQOolfa9XvX+1uW
 aPswXnhIGYRzq/Nrf+CKUTbUmLCoofJV/PFADKq6/3HTJI1jBWhiUvTZR
 dbJ3XaGAHeUABT3OM2BgBdUbHRdrt7XDX0boWft8n6m2bLEvcWEmni47e
 6vSpOPai3Qi8RCdWKZg6zCh7VuZ7uGmgiBbfFBPtXiC78u51v7csabCtg
 b614rzUX+XVsgQlSRIrBxIRKeBQW4sIUjy/6dTogWMK+8MzgYgZlOgSjV Q==;
X-CSE-ConnectionGUID: 4a1ZUaTOTkuBOUGyRyw+bA==
X-CSE-MsgGUID: Ijp3YwGWQF27HrYJt1NrWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72470761"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="72470761"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 05:57:10 -0800
X-CSE-ConnectionGUID: nCm0sIDWRNiHRxPIVyDLpw==
X-CSE-MsgGUID: Diu6hGuZQniwfz460SHoUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="213905849"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 05:57:09 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 05:57:09 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 05:57:09 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 05:57:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=saV7AS9zX/9xRQaXoZxF/RZ0buafpXCui6lTNplQctvpJsSgu7ZI+X+4mUy52dnnxhtLQDVwQcpCOqn/Xx6WImvlShfnzky3SBBZPUgGCJqyF4Mf57ykXlxvhSH4KkmF+oWtBeY1fRcakow8fxvD11j8QChdmQEGACDZt3WOCz2BLboLkDbCjlsv8QHMo+oj5bY2MJKY5qjHCyKckcJqt0np+uDpTTwNNswygl1aJMhCgUk9kWrYLVZGMxoFHOcNzspTCKpHGIBGXI0i/y8JpTLZ3uljr1/aBDr37P9Sc5Yj+MT/33gzAhF2+3gMibcM1hHenn+djtVJVBdzHpi2mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z82zTeuDgpe836/Bz40zHQtmCEmdLupUovSn2OrZgiE=;
 b=ghW80ZQQYL0Mx+MzqcT4M7r+0XUTRbLPVuJK0XXoiR/e75auTctO0np5z40cS8ZmNLP5suitSUrMu/BzlTdkPVPaPgvyWsiCReYokghYRSzgjayig0lZjhFrWcVv2Amf5gruk0fj26DhAveeqpNdd+MhiPd7v4B8PBbmIQmpK898LY0/IvAIP9KRVXkaPoHQ0w7yMNXXOHdBZHDthj9adyI+IeWm/9A4Rnmq7sXtivM5INCSsLMqVothmz4NqndEWYIYqiQJ5U5AwMLHkboKAKSq1PSCdHIb0aLaQwMqdz+gGnqU4rr7oT0L3D+irp+aAN2zym9YILXV0TKETmhN7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 CO1PR11MB5171.namprd11.prod.outlook.com (2603:10b6:303:94::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.13; Tue, 17 Feb 2026 13:57:06 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%3]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 13:57:06 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Thomas, 
 Sobin" <sobin.thomas@intel.com>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>
Subject: =?utf-8?B?UmU6IFtQQVRDSCBpLWctdCAwLzJdIHRlc3QvaW50ZWwveGVfdm06IEFkZCBv?=
 =?utf-8?B?dmVyY29tbWl0IGFuZCBub+KAkW92ZXJjb21taXQgaGFuZGxpbmcgdGVzdHM=?=
Thread-Topic: =?utf-8?B?W1BBVENIIGktZy10IDAvMl0gdGVzdC9pbnRlbC94ZV92bTogQWRkIG92ZXJj?=
 =?utf-8?B?b21taXQgYW5kIG5v4oCRb3ZlcmNvbW1pdCBoYW5kbGluZyB0ZXN0cw==?=
Thread-Index: AQHcnFJbixPXJ0bQB0SLzSdaNeAjMbWG8fIA
Date: Tue, 17 Feb 2026 13:57:05 +0000
Message-ID: <8b1689e53c1e3b3ebe9810c86fc248a5040e52d0.camel@intel.com>
References: <20260212190305.804221-1-sobin.thomas@intel.com>
In-Reply-To: <20260212190305.804221-1-sobin.thomas@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|CO1PR11MB5171:EE_
x-ms-office365-filtering-correlation-id: dd15fe7a-983f-47a9-a3a2-08de6e2c6f72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?RzU0ZjMwRnMyVkpCMlh0SXg4RHFoTStpNHp5TGp1SFlVRFdKS01BVlFUQ3ph?=
 =?utf-8?B?WUJibENZSHBuTHZBK3FxNWd1NDVNcldnUnJnYzdBcVVDc0RaNWJGQzhIV0pN?=
 =?utf-8?B?OFRON2hVZ1ArQmF1Z2F2SkNnMERRRnNuZDcyTCthUER3NDRWOGViazVDYVdR?=
 =?utf-8?B?L3BlNzdnN3pRVFA2WlR6UER5WnI5dGNyaW9NZkdmblhvTHVxK1B4eENkcmxs?=
 =?utf-8?B?RGw5YTlWWklRc2swc0s0VGgrUE4xT1dxTmY1Y0ZTWEZ6Z1pQL0dNRVhONDR4?=
 =?utf-8?B?bmpNczRkTDNkK2lsZ0VzZnNqNWFtWm04LysxRUxVRVc0NGxmdTNBcXh4ODd4?=
 =?utf-8?B?T1lhUjJ6T3VWa2c2MnFiRUF3Q2dsWkFCN0oyVDJUamh0bC96R2twak9JUXY3?=
 =?utf-8?B?ZXZHY0x4c2ZnTUFGczJFVzF3YlEzK3kwL0pGaUVURU1Fb09oU29EUENCRGl6?=
 =?utf-8?B?NXVRaGRmQkNBL1lYZHVSc1V4MFpsZmhYbUdjdW9raXphemRBQ0o2blN3VUhz?=
 =?utf-8?B?V0dnTDRSQWtCRi9DaWVpYnpGUDVVZXJ3YUxkTjBkREJOUEllbzc5TjlxUUtX?=
 =?utf-8?B?NEU1SEhTclQzYytFUW4rV0NzdHp3WUtOOUFqVUp1b1ZZcUJWWnhQTDlmd09v?=
 =?utf-8?B?TU15S1lKWWJ4U2pGSWc2SXpUck1ocldWZWpqMkxVWGx6bXVJOE1Nc3ZxNitL?=
 =?utf-8?B?M2ZHSzFvZzVSU1lLaVo4YThScEdsVkMrK3R5alFpdnhmT3p6VkZaaWVLcHZH?=
 =?utf-8?B?WlBZSUpVMTFEUW5LNS83cWlPRTJueVBNSjdFYXk0dWtoQ3djR1F0YXV3djUy?=
 =?utf-8?B?MGNXdUFmOUlaWnN0U1FoRGE3U1FWNFMrb1Q0SXhPVlN5Rk1xQkxuOU5kQkRK?=
 =?utf-8?B?ZHZRemJGaDhDWWdhR0Z1bElsR0kwRlVVVDJxS3VWNmJRcVZzUVFvR01CRGhv?=
 =?utf-8?B?T2JlcGd5bE5wRWhvQytaNXdObW9HK2htWXczTkdLZHlMMlVFaGE5M2F2MzhP?=
 =?utf-8?B?YTFFbHVHREJabGlvbm1wTytxK2tWOXRRQjJpTXNHN3JVK01ncm90Uk9DTys4?=
 =?utf-8?B?aG1Gd2V6cnhBbTE4OGgvOTlnZEhYWmdpLytJT2Y2TENXd09hVmN2N3NuTWo2?=
 =?utf-8?B?WUlwVVJwYys0cFE5UjV4RnVRSXFpdFd4UnlLSmRqMVFVOFJNR2E3MisveHV6?=
 =?utf-8?B?SzRKeHMxaVhPSDBVRGNJeUN3bWEvOElsVkF3VGpoTVFDTGJLakVtSWlkNWYr?=
 =?utf-8?B?RlFYMktOMURJSjFUaWZYVGxFRzJwRytTQ1FlVk9zM0pNYVpqenlWTVNPSjQ5?=
 =?utf-8?B?dlhrV1JIWEo0OUJpTUZFeGx2YUNkT20wWUxkMFJMbGZUdFg1cEYzZEl6Rjh4?=
 =?utf-8?B?WUNnNFlUYzllT1JXVTZXMmtzZGJBMW53ZVFCNzVpaWN3MEpodC9jdWdvclZn?=
 =?utf-8?B?TU1tWGxnU1kyZ1ZTUFZpK2lDZVpTRkVTVFNlK3FtWTR2OGVmMldkV21raEh2?=
 =?utf-8?B?WVRJT1laNjhPeXN4TCtGd1pKcnFxY2JpdklsUVNQK1VFL0pCWFZ6K0RuVllE?=
 =?utf-8?B?QWVXVng0c3g2aUVudWhOSzdFVU9CZTU3QnJwaHRGemNhcUVlN3pLa25xWGJQ?=
 =?utf-8?B?bUgzTTJPT2hlOEgrcGwwMHdZeVE5RGxMdmRLRUxIUVk1SHVyazJMb29MV0VW?=
 =?utf-8?B?Z2hjYzNQcTdwcktDZ3RqTjJkQThUZjFHWFRuTGxySUpFdUNRZXVYcWkzdE1C?=
 =?utf-8?B?WnA3MUFSSUNvS1V0aG45MXQ2Y2pBVEtBLzRUdTlJRE42Q1NjMXJjdkNZcVBH?=
 =?utf-8?B?NEI2cFJtOUVEWEhlL01qWml1bGZ3eGVJcjVlZStrNmNCM241MXR0MEcybDBI?=
 =?utf-8?B?NW9MNVl6UGRKRGR6RC9sSW1pR3VYWmRPcHJ0RHpKREtBYWNTTSt4a25nSEhF?=
 =?utf-8?B?MTRCWkFpQ24rTWdvcEUrcEIyWGMwOFJjM1V2ejBJck5uMThLa0IvZzZHaXlX?=
 =?utf-8?B?ZUhiVCt0T05QZWxzZzdpZjRtdW9xK0lRZVFaMmhNeldLOTZkRVZEV1JjTnBY?=
 =?utf-8?B?TGJmY0ZEU016Wm1xR3hYeXVNYUdNSGFWWm1zUjlpdzRPVWNZZEdrUG9zbnF5?=
 =?utf-8?B?YmR1Q1RSMVU5S3lHVWpaVUhlcXVqNjZMUWRLNktnWjdQZHZ3L2NBc0JSU2dP?=
 =?utf-8?Q?9xMZ4tHTZXsJyNGNB9/d0KY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUlLQ0FEaFp4cE1TNlZNWnlYQlM4UzdGWkJVNFNrU0Z4OGthUHZEWW5HdVNR?=
 =?utf-8?B?UWU2bENqUjU0b3B2bUNYaHdjaER1UHR4OFdIRHFNZy93TEJWb2U1Rml6dWRz?=
 =?utf-8?B?OWZ2NzZGOWJyVitRdnEvYVAxM3JpdmY5VHR1OS9GMjhCSHVQR0JNTDcyUnds?=
 =?utf-8?B?YTAydHBaYTcydjI0OFBjUno3SjloUkVRd2VKN3NDSWIwQVppWGNTTE5sWWNO?=
 =?utf-8?B?a3hJL09UQktIOXVnL1BvMkZGWDNYSitKWlQ5NnFyR0lZTW5OdjdKOStMWXFj?=
 =?utf-8?B?UllRRTY4aGQxcGt4b09lNzZMeGxySnhXUFlUTlJ0Skp0OWVucTBpMmpGSHJ0?=
 =?utf-8?B?YUxVbjJlc0dieTV0eW41TlE1QmoyT2UxcFl4Mzh5VzhTUUE5aDJRamc0S3Y2?=
 =?utf-8?B?QUxZVGJWQ1RNbmQ3MCtJeThPeGwrbnpOWm5SeGxXK01sRGttaUVONmM4WDhR?=
 =?utf-8?B?TEJmenFQUEVNTXcvQ3Roc3dJNldQOWdtWUNOaGpHK3VKQ0tMMmx3YUpzMFpV?=
 =?utf-8?B?MWRDL1RJRXNKKzNuMy9iWkwxeVhFK3VvcXNrVUl3VXVla0lIbkp6ZHFGRk1a?=
 =?utf-8?B?VUhNaXBON3hVNjlDNDRQK2RuV09OWjhKZEFZQXpjSHBWbDA3MTZ1MDhLSUtz?=
 =?utf-8?B?Mk12OXBwWVVQYlViQ1hHaHUvdUNES1g4dEhSTmgxc3FORDZNMG5uTXhUditl?=
 =?utf-8?B?ejVyMEZDOE1rQmdsU3pBTU9Ld3NvZThMVUlVdWg5cGlMcnlJY2w2WnZ4UHZS?=
 =?utf-8?B?Q3p4Mm5ySGtOQ2lGdWp0eE5JTXBzSisyQzZOUERCUEFSQXQrdnVKYUJJdEZZ?=
 =?utf-8?B?MEtnNFAvSmVIbG5aNzhPZjNFY2FiNmVoaXZBa2dseWtYZ1dyWERJT0Rzd2lh?=
 =?utf-8?B?SlFsUHRIWG5yczEvTFN0WHMyb2RrZHd2OUR0bWdFdzg5elB2dzFqSzZaWVpN?=
 =?utf-8?B?S0N2Y1pJTDZMc1MxWW9xMStJbUhsZXhYQzRJZzhEYUlEck9NVUxWc3c4c3Nk?=
 =?utf-8?B?WjRYYmVGcHh2U29KbWVjekJzc0VsYjhQMVpJclN5M3VkczdEenNrRGV5WnV4?=
 =?utf-8?B?UUV5WUNIZW9sblRCd3VrSjF5VVZsS2tEc04yekhZZ2k2ZlBHT2t3K3cwZnla?=
 =?utf-8?B?WmRnVWlFWTk4R3ZWWTEyeDlVZk5VSUFSbXJ4RzNES3RzUjR5UHI5YXAyNUlj?=
 =?utf-8?B?TTJ4L3hTdTFwQTk2RURzOEx1a0c2UFZQTXJyY3NyVFcxY2ZzYW9uT05Id1N1?=
 =?utf-8?B?UGZkZUxlbmJMTjBTMHA4Tk9OeW04NmxsUkRhZXpZd0E2ZjlmY1ViMi9ITHAw?=
 =?utf-8?B?eGVZUlNiRG9HMDA2ZWc2TEYzeVd2R0xYSGx0R0ZXQWIxYkNqZGVXaWs3Y2JF?=
 =?utf-8?B?Ull4MkxBWTZIKzBuQitiTHA3Q1BVQ0lhWG5Jbi9lL1MrS3pWTjYySkZublQv?=
 =?utf-8?B?NmVtYlNBTk96QkRBQ05PVVFpdm53emJIVlJZVDV3UVFqV2xWeDhrbi9DSXFt?=
 =?utf-8?B?dVNNblV3clRSWmhPaHJVYmtJM0NTbVNXbUZqTWl3by9Td0ZicVZIdFlFSUpw?=
 =?utf-8?B?cU0wbW5kclBjcndLZHZ1K0hRVmRDMFdtbVpaTXpCSFVKcFczUTAra1ZLdDZr?=
 =?utf-8?B?elhHSVMzNytGNWhyenlOZUZEWGxJRGFXZHFIakNUc2I0dGc4dTZsOTZENk5Z?=
 =?utf-8?B?QkowWndJVmROMWc0TWFJOEZRZ3ZVRGVDQmhHcnlidmx3OFY2VXhyY2RybXNs?=
 =?utf-8?B?QVNKa0NuQnM1ZXhkOGdzWmlqWEVXZGR5MlNNWUZmSmpxRWVpUGFrZFh0WU0r?=
 =?utf-8?B?RHFrY09HU2pOU2dDcVEvdTlBS3JTZVZYUysvZ0RZUnluWmZQQVYrcmltSVA0?=
 =?utf-8?B?UjNIOU1STkZDNVE2Sm1FNUdpZDF6YWRRa3ZWOWJ3NjY1YlR3VmVRaEp5WVFO?=
 =?utf-8?B?U0g4Z1B3bm1yOGhnd0gwaTVtcHpWOEZLVlg2UHhkemIyY3BETW9VRVJtbVdn?=
 =?utf-8?B?d3VMWkg3TDRES01EMVIzNkFJZnF5dlNRQ21WLzhLZ0pzL1BvNU8rRTVEc2tn?=
 =?utf-8?B?MzFMeGRhdGovRkd3UHdyQ2JZUVdKOFJRdkZxK0F5OXBKdy9pMXBCU3hwd3FT?=
 =?utf-8?B?eGNsOW5XNnhjcW5wNDhKZ1ppcEplVG4vcGVwVDFuTWlWem5sM1UvaHBnb2F0?=
 =?utf-8?B?U3ByR2xFS2xJZ0RBUFhxcEFKT0M5Y2x2eTBRZVBvOVJGOUp0TWtiOGFobHhr?=
 =?utf-8?B?ZmhlZUV0YWRxRkMwelFXcGZmbGpWaDZraG53SCtZRGFoZDVkZmpEMmlqQmxK?=
 =?utf-8?B?U1VKbzFXZzNSRjNHSzhkV2xYTlZOMHFwQU5PK0dQZkNRVTBzRkdaUFNSL3I0?=
 =?utf-8?Q?GBHdIRALM16ciU0PW6bNNEiKavk5YRlRM3CSwpywSRLLi?=
x-ms-exchange-antispam-messagedata-1: zSYPfbP7cRKl0w==
Content-Type: text/plain; charset="utf-8"
Content-ID: <23DA39EE5F3439489EBC573C2BA88458@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd15fe7a-983f-47a9-a3a2-08de6e2c6f72
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 13:57:06.0234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7QCW/fkgl/f9XCxq6lU6BOaQcBzTf+gaw4JHud7A17SgEAhKl7Qr5aSSVk9vgFQPx8c8POW2FBJTs2rC0DfqbEDWOg8HiJLMlcpZBPfX3Vk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5171
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

SGksIFRob21hcywNCg0KT24gVGh1LCAyMDI2LTAyLTEyIGF0IDE5OjAzICswMDAwLCBTb2JpbiBU
aG9tYXMgd3JvdGU6DQo+IFRoaXMgc2VyaWVzIGFkZHMgY292ZXJhZ2UgdG8geGVfdm0gdGVzdCBi
eSBhZGRpbmcgb3ZlciBjb21taXQgdGVzdCBpbg0KPiBmYXVsdCBtb2RlIGFuZA0KPiBub24gZmF1
bHQgbW9kZS4NCj4gQWxzbyBhZGRlZCBzdXBwb3J0IHRvIHRlc3QgdGhlIG5vIG92ZXJjb21taXQg
ZmxhZw0KPiAoRFJNX1hFX1ZNX0NSRUFURV9OT19WTV9PVkVSQ09NTUlUKQ0KPiANCj4gU29iaW4g
VGhvbWFzICgyKToNCj4gwqAgdGVzdHMvaW50ZWwveGVfdm06IG92ZXJjb21taXQgdGVzdHMgZm9y
IGZhdWx0LW1vZGUgYW5kIG5vbi1mYXVsdC0NCj4gbW9kZQ0KPiDCoMKgwqAgVk1zDQo+IMKgIHRl
c3QvaW50ZWwveGVfdm06IFRlc3QgdG8gY2hlY2sgbm8gb3ZlcmNvbW1pdCBmbGFnIGluIGZhdWx0
IG1vZGUNCj4gDQo+IMKgaW5jbHVkZS9kcm0tdWFwaS94ZV9kcm0uaCB8wqDCoCAxICsNCj4gwqB0
ZXN0cy9pbnRlbC94ZV92bS5jwqDCoMKgwqDCoMKgIHwgNjM0DQo+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA2MzAgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkNCg0KSSB3b25kZXIsIGlzIGl0IHBvc3NpYmxlIHRvIGNyZWF0
ZSBhIHNpbmdsZSB0ZXN0IGZvciB0aGUgZGlmZmVyZW50DQptb2RlcyBhbmQgc2VsZWN0IHRoZSBk
aWZmZXJlbnQgbW9kZXMgd2l0aCBmbGFncz8gVGhlIGZvbGxvd2luZyBzaG91bGQNCmhvbGQgZm9y
IGJvcyBpbiBWUkFNOg0KDQoxLiBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERToNCmEpIElm
IGJvcyBhcmUgY3JlYXRlZCBpbiBWUkFNIG9ubHkgYW5kIGVpdGhlciBsb2NhbCB0byB0aGUgVk0g
b3INCmNyZWF0ZWQgd2l0aCB0aGUgZmxhZyBEUk1fWEVfR0VNX0NSRUFURV9GTEFHX0RFRkVSX0JB
Q0tJTkcsIHRoZW4NCm92ZXJjb21taXQgaXMgbm90IGFsbG93ZWQuIENvbXB1dGUgaXMgcmVseWlu
ZyBvbiB0aGlzIGFuZCB0aGlzIGlzIHdoYXQNCiJ0ZXN0X29vbSIgdGVzdHMuDQpiKSBJZiBib3Mg
YXJlIGNyZWF0ZWQgZXh0ZXJuYWwgYW5kIHdpdGhvdXQgdGhlIGZsYWcNCkRSTV9YRV9HRU1fQ1JF
QVRFX0ZMQUdfREVGRVJfQkFDS0lORywgb3ZlcmNvbW1pdCBpcyBhbGxvd2VkIGJ1dCB3aWxsDQpl
cnJvciBvbiBmaXJzdCBleGVjLg0KDQoyLiBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERSB8
IERSTV9YRV9WTV9DUkVBVEVfRkxBR19GQVVMVF9NT0RFOg0KT3ZlcmNvbW1pdCBpcyBhbHdheXMg
YWxsb3dlZC4gU2hvdWxkIG5vdCBlcnJvciBvbiBleGVjLg0KDQozLiAhRFJNX1hFX1ZNX0NSRUFU
RV9GTEFHX0xSX01PREU6DQpPdmVyY29tbWl0IGlzIGFsd2F5cyBhbGxvd2VkLiBTaG91bGQgZXJy
b3Igb24gZXhlYyBpZiBvdmVyY29tbWl0ZWQuDQoNCjQuIERSTV9YRV9WTV9DUkVBVEVfRkxBR19M
Ul9NT0RFIHwgRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0ZBVUxUX01PREU6DQogICBEUk1fWEVfVk1f
Q1JFQVRFX0ZMQUdfTk9fVk1fT1ZFUkNPTU1JVC4NClNob3VsZCBiZWhhdmUganVzdCBsaWtlIDEu
KQ0KDQpTbyBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8gY3JlYXRlIGFuIGFycmF5IHdpdGggVk0g
Y3JlYXRlIGZsYWdzLCBibw0KY3JlYXRlIG1vZGUgYW5kIGV4cGVjdGVkIHJlc3VsdHMgYW5kIHVz
ZSBhIHNpbmdsZSB0ZXN0Pw0KDQpGb3IgYm9zIGluIHN5c3RlbSBtZW1vcnkgdGhlIGFib3ZlIHNo
b3VsZCBhbHNvIGhvbGQgYnV0IHdpdGggdGhlDQphZGRpdGlvbmFsIHByb2JsZW0gdGhhdCBpdCBp
cyBsaWtlbHkgdGhhdCB0aGUgb29tIGtpbGxlciBpcyBoaXQuIEluDQpwYXJ0aWN1bGFyIHdpdGgg
c3lzdGVtcyB3aXRob3V0IHN3YXAuDQoNClRoYW5rcywNClRob21hcw0KDQoNCg0K
