Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F745C36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 09:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFB710E81F;
	Wed,  9 Apr 2025 09:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K5k636BB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A315B10E81F
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 09:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744191645; x=1775727645;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EFDa01LME1J4+zoedRbuuTp/F9KW0OLt24mhU0wO7hI=;
 b=K5k636BBoaYpHuFFzddms34UIaUMfOcY2aVMKTHDakyW9ZoplOW+dPo6
 Rc4j24MNrp9bN51ofXWbXP4uIX6xP4s+shGPXrDKLQuMY0SYb0VuZU2QO
 CLlFticwxdAcnPPZjDTYGRLQKuLWqkD2/cvNNBBa9tl8Tmb0Do+hJ6Qof
 0RowAhEL/Yr0DwSJ89xzfkmKB6OqV23/FlD4Vrvb2dsc/ckJJtL+7+QPb
 O2RhBD3CnFXoZP5vW/TiAy5HWQlY1nM03Fx95gCrdUAg14sVQxfHQl3ZV
 Lp+xBpvWc5llEthxMOHYoOEUx5IJ0lnzLJIgipE2nvkaFnmmWpGgcqQPr Q==;
X-CSE-ConnectionGUID: CzcXDnmdRvy1h9MJSrRhFg==
X-CSE-MsgGUID: MxtbjJa4SpeQIcialtldOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45671195"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="45671195"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 02:40:38 -0700
X-CSE-ConnectionGUID: FhRUpVoQTmOdOp6BQ+pSEA==
X-CSE-MsgGUID: 5uEngWydQXujSZ1EWqjxIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="151722356"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 02:40:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 02:40:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 02:40:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 02:40:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKS6Omr9jD4hbU7CZBQPGYKYn/xq3Gm4bTueayzDmBAZ1It14gMpEYrK2+sLr2k1uMMNFGWsrRGPSXuAeLGHE2Rgxmkk+OWBk7b7chtRd7KuMMhiPP7stOIkqUsgIefBBoShVrygGOp5H0JCFIlBAiePQYpKDwx8EHTFaV3ukofJNv6sraxMF9CMQfvVrq155jn20e/tY585OYblg5/Ju6djFYyBvKVxJATyjM4VSupEudQUGZTYaTVEhvWHdodJqZ4DNcdwifHGkiV7b8ItibdU9u2NY0L8Y3uOGfg9kJHnlFn+W3wsNJ4LoTV5BBDVqim/D4RRwFsUd0nuRebjVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFDa01LME1J4+zoedRbuuTp/F9KW0OLt24mhU0wO7hI=;
 b=H4beql1y8YQrEIgBzhEcYr3yiiLnkeg5IsTxiBIome7rMnlf9+YRtdOotRWkK4wsJ3+zDYEZC01ctFE3q8eyi+PNLamGW4ijyIVKYe0sQHIvXQCQsds/VkRzdpOijc1+wbsfyvlczT9tyCz9PdGV1fLWLcPgKb7YEJYfrNNMaa+RRgBslUJsflj3slBcgZ9VKkJWRkwWBkQLmVuWgVszA+dTYIsfQ7dBydcKCxLcP7oIErZOsC8/ivg7GrbZK9WYUAKjDbzGdM94F65NL8i8XWx0HrjzvbYrWJxM3dgXdhm5yAn3K0v5jegdK+X1/DRaj1ObSI3ke4vZmt64vTJJ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SA1PR11MB6944.namprd11.prod.outlook.com (2603:10b6:806:2bb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Wed, 9 Apr
 2025 09:40:15 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%3]) with mapi id 15.20.8606.028; Wed, 9 Apr 2025
 09:40:15 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>
Subject: RE: [PATCH i-g-t v3 4/5] tests/xe_compute_preempt: adjust number of
 children according to ram size
Thread-Topic: [PATCH i-g-t v3 4/5] tests/xe_compute_preempt: adjust number of
 children according to ram size
Thread-Index: AQHbqLc5JnnLs87VfkuKgHneMEoFPbObFT3w
Date: Wed, 9 Apr 2025 09:40:15 +0000
Message-ID: <CH3PR11MB84349C91751C08B8D32F3C438DB42@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250408185045.272673-1-zbigniew.kempczynski@intel.com>
 <20250408185045.272673-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250408185045.272673-5-zbigniew.kempczynski@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SA1PR11MB6944:EE_
x-ms-office365-filtering-correlation-id: 956ceeda-734d-4b53-115c-08dd774a8840
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eEkyUWs3WEdnU0hpcmllOTJEVjRwbGt1Rmk2OWRKWnpMWTEwMVVYU0h2TUJi?=
 =?utf-8?B?REFJYnhVdjhqeTFScVRhakE3b29xWEs3c3FxaG5FbmNFTDJDdExoVEZnZm1M?=
 =?utf-8?B?MmpQMEZiYk44bnlPbFljOCtQUmpsR1pzODYxd0lGZzRONDBYZUJ5M01tZVdx?=
 =?utf-8?B?SW9sWnNUaGxSRmFNQWhqaUcvbFcrSjJxYXJaUTIvcUhad2t3aU9TZGhSZ2Jx?=
 =?utf-8?B?amV0YW5SUGZsTWQvYlpGZXFTU1ppSTNaVTl5cE5FN2hCQnVWSWpBY1F1RFQz?=
 =?utf-8?B?S1pNV0o2WVpiTmlTY25ZVlc2ZERIMlVXSUhkTmZkUHJGb3ZYN3BoK0x5d3Ux?=
 =?utf-8?B?S0NlUnlzR2xYdE9McjROQ2x6czFUS1VUOFRMcEpkcWtnWC9JYllKRjB5RkVn?=
 =?utf-8?B?Z3VxcFhpWG01UDlnYXlBdzlrZ1FRWXFUMHBtMUM0aTFEOFdMY1Q3Uk9JbE9z?=
 =?utf-8?B?WVlvUVFNNER0bVFtcFUvWkk2U3kvSjZEVnBlTlkyUWZ4ak8rOUN5bDI2TUlO?=
 =?utf-8?B?M1E0T1lUc1p3WUhLZGRqL3p1VHRFendjNmsxT3U0WC9sdHEzSURVeGMwZTY4?=
 =?utf-8?B?dTVQcHV6ZzFaOEF2MVZrS1lod1BSZXRLaUhLYkU4bWcranlhMGkwM0FVckxh?=
 =?utf-8?B?dnJaKzRndTNmeU0yWjNCa2N0M1BBbndmUGZxSXZ1ODBRcFM5QjNDU3h3TTF4?=
 =?utf-8?B?UDQrdEdTZTF5alZpK1Q5Y2tyMC9kMzFTMldLWWc0NDlNOVhzWDdqcDNWRWJT?=
 =?utf-8?B?ODFjTVNPNWw1c0d4Ny9NcGlZS0tmWklpMHErczA1aEgrbnk2ajZVcGVNaStO?=
 =?utf-8?B?OUFwZ0RFcXNnWTlXRVV2NHZ5c1lEczlEWmc1NXpOaTF0Qyt5alp0eHVwWnBI?=
 =?utf-8?B?YzhTeVNyMjFLVjlWb3RpSHAzRzc5OENhV2FuN0pyWXQ3OEdQckphOXROT2Zo?=
 =?utf-8?B?TUVUZTc5TmFhdnJ5bG1xUzMxS0FaTDBjejl5K3cwYkFDeE9Fa0FtaFNaUU0x?=
 =?utf-8?B?YjROdHAyeUk4RnlCWFNuelhmOHZpOCs4bzNQZVJ2NWNrQWdzMEc5UU1YUThD?=
 =?utf-8?B?aEN1SFgyYmxTWWprck5IZnFKQ0hSVkVQMUJpaUJPU3o5TE9Ta2ZrWEFzV0s4?=
 =?utf-8?B?RzB2azBCbEZDbkFyM3ozREVYblVHcnBPK1pwVWhwK1ZtSVdrKzNvMko0RlpL?=
 =?utf-8?B?SUtLditSUElBZ1d2MGp2RzJIdWdPVVNhOUhPWUpnSzlaS0huQnFlWXhJajNn?=
 =?utf-8?B?OFZtWkVJN2hqODBJSUZ3TGtycm9KckxpcmJ3TjhuMWVERVhiWkdQdUp2ZXp5?=
 =?utf-8?B?WXEvSE03dlVRUkZkVzhMTGpicHl5WVg5ZE5vSmtBOHFKL1RuWDVlLzZ0NVZ3?=
 =?utf-8?B?MzBERjhLSDNHdGxGMmFMTE50dGhzdTNxRFZYbFNSa3pBc2hpa0tVd0Rway9F?=
 =?utf-8?B?ZGdOb2VhN1JOYlpQR1RUVHREemxLNURZTEh6Y0l3WUN5S1p4Y0I2VG9TZWZl?=
 =?utf-8?B?TE5QNG9QT1RqV3pvZnNzbFVLdXdjaWYxY3hveTNIU2x2b2Q3Ui85OTVFSGM2?=
 =?utf-8?B?SUxFT3p2K3lpeEZHekdoUFc3aG94bXpKQ2lUSGFZM1MxN05uTCtDWFVBdnJ2?=
 =?utf-8?B?UC9jcG9uOU9meWJNa2orU1U1dE95UWYwUGUxYmxCcC9FR3lmTE8wWUUxZ1lk?=
 =?utf-8?B?ejcyRVphZUtSUUthMzI3ZU15NnQ1R1k3VFZKMmw4V2lkMTBkY2grSDVSMjRl?=
 =?utf-8?B?eFU2dHhwNUMzU0hwQ0VJdHpiSFlCSGQzMGpSdzAzcnpWN1dHTzJ3U090ZXVv?=
 =?utf-8?B?V2l6aHF2RC9rN3RSM0ZnNFhTV0dMK1drSUc3U2NCL0owRmFuazFoamVlQms5?=
 =?utf-8?B?bVVLRTZtNi9XTHBtTG8wQmtzUmpZT21lZWNxZ2EvNFFWZlV0VndFUDVWM2Ur?=
 =?utf-8?B?cFBSNUxRb1pGbkdNV2I3MnowRE81bG9WR2huZHltMW5UYTZORmliOVdDWXhD?=
 =?utf-8?Q?2JOXu37XLFdBIgjJinCKG9cm9vMFJw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0d4cTJ0ZVFGQUdwcG9XSE9mQkVNTG4yVGNFS2RmWkx2azJPYS9JOGRhWTNY?=
 =?utf-8?B?UWIra1dKaG1Ta3dSOWYwdGNLVllYSDNmc293SW12cGhHNzNpTlZZcnVCRFZS?=
 =?utf-8?B?ZitiUGdaYmRSN2docTMvZEVkY2xvVXdzRG91dTBKRnVCbTQxekpFOGlNdEJx?=
 =?utf-8?B?czVhc3dBUU1BTHhBcmlVOE9ka2lLaC93QmpweVljUEZ1THRwUzZrVG56elN1?=
 =?utf-8?B?TWpaSGpwUkh2UDBHRFFPTUh2anV6UnU2NGJRVWN2b1lYSm9YM1hBVzQ5bW1v?=
 =?utf-8?B?UVQ4KzloMkszbWo0WEFlYlJMVzhsSG53OHR0S1JxeFJTbEFaUkdyMTFUbVkw?=
 =?utf-8?B?OVI5ZDN3a1pxZ29JdEtCNE1ieWo5VjlPc2NBRERtOTVMekQzVDlycHZndENw?=
 =?utf-8?B?S05KaHRpM0dQS3JZU0lqYW41Z1FGNjM1SW5Qd0VyWGZkZ2JMNGJQRGtzNDV0?=
 =?utf-8?B?OGRVcVI2T0RTbm9idGh6ZG8xVUhXTlFRQkNuWldrRUlZKzlZQXg5ZDFENWxO?=
 =?utf-8?B?Z3QyY3dxYzcyZlc0cDcwQU9tTnhQUTdRRnppU0V0ZHhOcHRtclkyamZJUWJK?=
 =?utf-8?B?Zjl5Z1RIeHQ3YVVzS1p0T0Qyd0U2NVd4RkdvRXhTT1JKMTM5NThJSitFb3Bm?=
 =?utf-8?B?dXFZYkpSUDF2ckNRMlRGNStuSWFEajNCNVNrOW15a0YweU9sUFIyUDU4eTk2?=
 =?utf-8?B?c2x6d01TaXNCY2ZiZ1pkSFhJbnY2ckU0QjRjTEhJemgydUlZTG0xVk1uRCtI?=
 =?utf-8?B?cGJ0ekJCOTdWV0luWnUvL1ErK1RPU3BTakJISFZZQU5YemwrVlNha1NmUlJ1?=
 =?utf-8?B?VVNueU9XVDFESDFDOWpjK1dqZ1FpTTRYMmdQYWYzRTFIN3lONDBidzlxNW1B?=
 =?utf-8?B?REdRVXFIeG0rdWpPaEMxbmhLd3dLdUwwdzQ0blVZZVlnd0doSnJjNk9FUWFX?=
 =?utf-8?B?L3U1ZVVnME9jM2wyeklDM2xaMndEUFRFbzR3dE0xNmxzV2FRcU5MM2g3bTNN?=
 =?utf-8?B?YU01bkxERjUvNmdKS0gxbzJ4NEl0UjZCVXB6am94aXg4Zit3UjZlRC9IRUtz?=
 =?utf-8?B?ZFNuRUN4R1FFOXdGTWE0aURaZkRWMEl4R0hKbml5TDdUK3JuM29hUUtYOWdS?=
 =?utf-8?B?aXV6T21PUnZlNk90eUdwdm5uWXVXZVhHRDlPNXMzdy9XMlE3aEhpKzZwY0RS?=
 =?utf-8?B?VDN5NFJjRGR0TmRlVkdUVEF5N3lGMlU4VFd5MzVTblE3NzI4S3JjSlpLSnNp?=
 =?utf-8?B?Um40LytLRVpBV0xCMy9LVjhJeURjTjJuLzhIL3JEdm1SYUVBdGk5L09vNU9W?=
 =?utf-8?B?Z3BWWW1FdFp1cUFJeHlrMmNiUU1DZ1FlYVlCazZsY3U2WHk1NkNaYk0vMENW?=
 =?utf-8?B?bzdCZEx0VGt2dTJXVUdQWUJGSlJmWUdHTGZlTVNicXBLOWVsTUViVVZDd3lW?=
 =?utf-8?B?TjVHYWRyMkcrMzVxYVlYS1dsRC9xT3htVU5CNFJxVzd4TmdRdW82K2F2R2Zl?=
 =?utf-8?B?cWR6Q3BFMjJRVmlFT3lPMVRqUXJDSlhYemMrbGk1RjZLeUJnUmtWdUdxaFNM?=
 =?utf-8?B?VTNhOUNCa2tYZkVndDRYUWRCc0hMZGdHZ25hOW1ERFJWSlh6RVQyRUtWRkdt?=
 =?utf-8?B?ejl5NCtwNExTNG1mV1c0QXB5a3d2NkRLUDNHd2x0OGJ5WFh5a1hLbmdDZ2tu?=
 =?utf-8?B?MmRsNTBvc3czcThHQXdtcGNndTRUMnZzSm9mY0hzU0trRU1GWGFRVlp0MnJU?=
 =?utf-8?B?aGJHUDZac2g4dlU5Zk9tTnlXRWpGTzVNWHg0TWIzbE9PYWJnZ1dlcU1EdGp6?=
 =?utf-8?B?WGhZSDB0NGszcm82WWFaeDdSQjIyZzNhNkxuUy9uNUd1V2NYbGtSb0EyaWR6?=
 =?utf-8?B?L05JdW1SODdkakxkS1k0R29pK01YQ25MMU1lZkNwQm9vZVFJRjRkRDVVOTRt?=
 =?utf-8?B?M0lydEZsQ05WVXpqK2lVenM3WUNqVlNtMFlCR3dDQ1UxZ3JyY3pBUjVZdmhO?=
 =?utf-8?B?bDIybjdhMVpKd0MxVWZkTHcyVHpOWHpENElsdGVJaEN2V21uRG5QU1pQVTNC?=
 =?utf-8?B?bVUwUXNCc0ptWkdGVjZLMDJvc0I3ZDVYdWQ2cGNhTFBpenhNRkZjNVJzYm1o?=
 =?utf-8?B?b0pxVFdJeGQxR1VaVWhZTzc4S2c5aDdnSXhPZjZVeFhkdllVWGpLV2NwYW9l?=
 =?utf-8?B?TzJwNkRHK1FkNllZRVZwdGRqS1hmd3pJMHduNzB3akVIQkgwd2xIaEMyUUZa?=
 =?utf-8?B?cUxXSUhaQlNscWp0TitUWVJxejNnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 956ceeda-734d-4b53-115c-08dd774a8840
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 09:40:15.3084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BrThl5ycIqn254GUS+JsTQl9GWYLud33HXEzoM0WenkB7iClgKjA2CAGRTk8CbeCrgsHVAeRcfkZElglIt8mls3Q+ZaaAfOB+Q+y3yunT/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6944
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

TEdUTSwNClJldmlld2VkLWJ5OiBQcml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVk
aUBpbnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2Vt
cGN6eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IFNl
bnQ6IDA5IEFwcmlsIDIwMjUgMTI6MjEgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+IENjOiBLZW1wY3p5bnNraSwgWmJpZ25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tp
QGludGVsLmNvbT47IER1Z2FzdCwNCj4gRnJhbmNvaXMgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5j
b20+OyBEYW5kYW11ZGksIFByaXlhbmthDQo+IDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29t
Pg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgdjMgNC81XSB0ZXN0cy94ZV9jb21wdXRlX3ByZWVt
cHQ6IGFkanVzdCBudW1iZXIgb2YNCj4gY2hpbGRyZW4gYWNjb3JkaW5nIHRvIHJhbSBzaXplDQo+
IA0KPiBTZXR0aW5nIGFyYml0cmFyeSBudW1iZXIgb3IgY2hpbGRyZW4gaXMgcHJvbmUgdG8gb29t
IHNjZW5hcmlvIGFuZCBnZXR0aW5nIHRlc3QNCj4gdG8gYmUga2lsbGVkLg0KPiANCj4gU2luZ2xl
IGpvYiB3aXRoIHNpcCB0dXJuZWQgb24gdGFrZXMgfjEwME1CIGZvciBYZTIgdGFza3Mgc28gYWRq
dXN0IG51bWJlciBvZg0KPiBjaGlsZHJlbiB0byBjb25zdW1lIH41MCUgcmFtLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBp
bnRlbC5jb20+DQo+IENjOiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5j
b20+DQo+IENjOiBQcml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5j
b20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwveGVfY29tcHV0ZV9wcmVlbXB0LmMgfCAyMCArKysr
KysrKysrKysrKy0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfY29tcHV0ZV9w
cmVlbXB0LmMNCj4gYi90ZXN0cy9pbnRlbC94ZV9jb21wdXRlX3ByZWVtcHQuYw0KPiBpbmRleCA4
NzZlNTM4MjM3Li5mMDdlODdkNGM0IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9jb21w
dXRlX3ByZWVtcHQuYw0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV9jb21wdXRlX3ByZWVtcHQuYw0K
PiBAQCAtNDAsMTMgKzQwLDE4IEBAIHRlc3RfY29tcHV0ZV9wcmVlbXB0KGludCBmZCwgc3RydWN0
DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3ZSwgYm9vbCB0aHJlDQo+ICAJaWd0
X3JlcXVpcmVfZihydW5faW50ZWxfY29tcHV0ZV9rZXJuZWxfcHJlZW1wdChmZCwgaHdlLA0KPiB0
aHJlYWRncm91cF9wcmVlbXB0aW9uKSwgIkdQVSBub3Qgc3VwcG9ydGVkXG4iKTsgIH0NCj4gDQo+
ICsjZGVmaW5lIENPTlRFWFRfTUIgMTAwDQo+ICsNCj4gIGlndF9tYWluDQo+ICB7DQo+ICAJaW50
IHhlOw0KPiAgCXN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpod2U7DQo+ICsJ
dWludDY0X3QgcmFtX21iOw0KPiANCj4gLQlpZ3RfZml4dHVyZQ0KPiArCWlndF9maXh0dXJlIHsN
Cj4gIAkJeGUgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4gKwkJcmFtX21iID0gaWd0
X2dldF9hdmFpbF9yYW1fbWIoKTsNCj4gKwl9DQo+IA0KPiAgCWlndF9zdWJ0ZXN0X3dpdGhfZHlu
YW1pYygiY29tcHV0ZS1wcmVlbXB0Iikgew0KPiAgCQl4ZV9mb3JfZWFjaF9lbmdpbmUoeGUsIGh3
ZSkgew0KPiBAQCAtNjQsMTMgKzY5LDE2IEBAIGlndF9tYWluDQo+ICAJCQkJY29udGludWU7DQo+
IA0KPiAgCQkJaWd0X2R5bmFtaWNfZigiZW5naW5lLSVzIiwNCj4geGVfZW5naW5lX2NsYXNzX3N0
cmluZyhod2UtPmVuZ2luZV9jbGFzcykpIHsNCj4gLQkJCQl1aW50MTZfdCBkZXZfaWQgPSBpbnRl
bF9nZXRfZHJtX2RldmlkKHhlKTsNCj4gIAkJCQlpbnQgY2hpbGRfY291bnQ7DQo+IA0KPiAtCQkJ
CWlmIChJU19QQU5USEVSTEFLRShkZXZfaWQpKQ0KPiAtCQkJCQljaGlsZF9jb3VudCA9IDUwOw0K
PiAtCQkJCWVsc2UNCj4gLQkJCQkJY2hpbGRfY291bnQgPSAxMDA7DQo+ICsJCQkJLyoNCj4gKwkJ
CQkgKiBHZXQgaGFsZiBvZiByYW0gLyAyLCB0aGVuIGRpdmlkZSBieQ0KPiArCQkJCSAqIENPTlRF
WFRfTUIgKiAyIChsb25nIGFuZCBzaG9ydCkgam9iDQo+ICsJCQkJICovDQo+ICsJCQkJY2hpbGRf
Y291bnQgPSByYW1fbWIgLyAyIC8gQ09OVEVYVF9NQiAvIDI7DQo+ICsNCj4gKwkJCQlpZ3RfZGVi
dWcoIlJBTTogJXpkLCBjaGlsZCBjb3VudDogJWRcbiIsDQo+ICsJCQkJCSAgcmFtX21iLCBjaGls
ZF9jb3VudCk7DQo+IA0KPiAgCQkJCXRlc3RfY29tcHV0ZV9wcmVlbXB0KHhlLCBod2UsIGZhbHNl
KTsNCj4gIAkJCQlpZ3RfZm9yayhjaGlsZCwgY2hpbGRfY291bnQpDQo+IC0tDQo+IDIuMzQuMQ0K
DQo=
