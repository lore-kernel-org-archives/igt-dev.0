Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EADECE564
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 13:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE60B10E7BC;
	Tue, 10 Sep 2024 13:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gpRrxD0R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BF910E7BB;
 Tue, 10 Sep 2024 13:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725973687; x=1757509687;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=FwH7sQ2DoT1Fjseyje3tPfWETwlJ+nGrBWGg9QOJ1D0=;
 b=gpRrxD0RPb1M045EVFXCYCRqnVUX0ujL3fnNpiC6Y0YVTh5sK7EzKGD3
 27Qp3HusyD3EP7GZkNyKzfnDQ5nsdr3Qlt9rh9/xDVCVl1kJF8zX+BsV/
 0JYNEmBQX8cC3zGJ0VBoBMTBd0l9dir+cMWI3a2h3FwhT0usQb3kEWnYg
 Rnk+8ZC5ssZgVaqxFsG/b7BWQ1xIQU854cGz0HoHMw874U3rXkt4nAC4T
 BVoh+wYLdMJaG1PNzL17Mi6IvitoNrxh5Rk4Cy01BNeQ6oEBRoRVp5m0t
 MSqweMZYhvRArP88fqU5ux4VnLa8NqgYa2Q870obHHoqP5EiNnY5fxLU+ A==;
X-CSE-ConnectionGUID: VLApui7/TkuCQcD4es3pBw==
X-CSE-MsgGUID: 4psziM2xRM+IkI/r3prCWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24217464"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24217464"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:08:06 -0700
X-CSE-ConnectionGUID: oScNSZJSQrmxtFqMzUrubA==
X-CSE-MsgGUID: Tz+pOzE1QduSFLz3sQBibA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="90312429"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 06:08:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 06:08:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 06:08:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 06:08:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 06:08:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjxY20itPlBLm/2ehQNGnsvLrl1JtzIhkyyzPt/TmNw3C9xFjvDq3+iClVv6CP9eAPgfBNsCMw0NhmcCO73h9gsKg27rxkKCG0+oIbpfyBvPB5OQDKFa+NPbeeDQ/mCql8l1WcsEAFRfGKGt7cc4MlHAKg+I71ngjUEsWcrDLM8TwytLzMKGEPBoOdyV1nOHQqwE/T0FR0kSyWdRI99oaN71FWDcEZe14JjqT88UK6M4Tv8gvjlmHf2IBoMLlhUvRo+xViOHxTBYRtROzH2PbvjfLjo2PK+Bswgzu7RHN3HOXjWY1oLH8AEgUk9lBMG/Cy5SJxgaUE3G07tGE0Qj+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwH7sQ2DoT1Fjseyje3tPfWETwlJ+nGrBWGg9QOJ1D0=;
 b=xc8agRGDpO4yz8IIaMRvOVzu9jCzKtOIC3NbjKS7NhqtLtTAlVq+pMTvrXe9eNi5QfrD/9J0xpdoq4GU7ssyqVEWTxllqEKlmDKMsq+iPJRzAfyHJvd/omWMsqUmrzxdZy6uneHTUkRhhneIjo9nFERGWLRQsqq/VmmE/6Oh24DwmcbLw17IoS9iXbI5pBrSMdbzwUjUL+cVFUb7Z83EXf/ekZfqhcDXwmN+s+HnkI5rQpUEsyfedN6xHUmgboLf4ksCaoj5EtEg5KXITf0IJCm3iC/6fp/y8uGX+Y4WLLHieToGxNysr2061Mo8lalIHW6CEQ30Hrm0xqK5lCldtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 by SA0PR11MB4733.namprd11.prod.outlook.com (2603:10b6:806:9a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 13:08:02 +0000
Received: from PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf]) by PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf%5]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 13:08:02 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
Subject: LGCI Ubuntu 24.04 Upgrade Reminder (2 of 3)
Thread-Topic: LGCI Ubuntu 24.04 Upgrade Reminder (2 of 3)
Thread-Index: AQHbA4J3ZOojxjOEZ0a6RRdIhxy8dA==
Date: Tue, 10 Sep 2024 13:08:02 +0000
Message-ID: <3fc78338aa1e60238532a643c1d306e5b17e2662.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5861:EE_|SA0PR11MB4733:EE_
x-ms-office365-filtering-correlation-id: 032eb09c-35ae-4cd3-968b-08dcd1999a31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Z1ZSMURheTBOd0RyQ3NCaDk1cTF2R3BrMXZKMnE4ZmpUdUhxSU9BeHM0aVdI?=
 =?utf-8?B?Q0pWeTVXbkVVNW8rbnVCZjV3ZTllaE5HR1ZUMUxZSW9QVkR5YlV4UmZDQVpr?=
 =?utf-8?B?RnVJbjBYSzVjSHVkL3B3bitQZjU1K1FKaVkyMnZLMnJBOTNaSE1QZ2NQSUtw?=
 =?utf-8?B?VXYzWER5VERJb3ptNlgrMmRPWDg1MVpmdkRuTysxTWh1b1pTU2tYdzhsT1Nq?=
 =?utf-8?B?THJpTjZHelhCeXRpYkpCVXpNVnhKZGZRUi9ST01YVkUxU1NVWU9wQVJjaFBO?=
 =?utf-8?B?ZWY0ejZIQ2hzbnlPQlNCSnJEYjJwbU1mSmw3SnFEY0tEYkZIeThNdUtScHNr?=
 =?utf-8?B?NHVUS1M4dm9jTEtoSTM0eDRiSG9CcGtDdUlzNW9NdVRLZ1M1VVlDdk9rQ1NN?=
 =?utf-8?B?OXc5RmtqU1d6U2JWWlQrREZkbHhkay84b0ZMY1U0bEhXMHZUa2gxaVg4citr?=
 =?utf-8?B?cEt3TGZ4bVJGdjFNbWk4VVdzS2haZTBYbURNSG1Zc0tpQjJOenJhdGRNRDBu?=
 =?utf-8?B?MUNLRGlLVUZ4Uk8wQkl5Q1R1dGtqQitPUmo3SEVoQVZVVzJERDBvK0ZkZnVs?=
 =?utf-8?B?MVdIeXFuVkN2bm9IOGxCcDBoSnpMTUFCRnhncUptbXZlbTk1M0lWMmFLK2kw?=
 =?utf-8?B?YXc1MjRnV1pEQmM2eFhScGcvcWJNckdGRE5teEhscWdrU3gyWnVHTytDcUQ2?=
 =?utf-8?B?NWJtZzVsNHUyeDNqcnpjeFpIbnQzdW1VSEFWTGFFQUMxRmlhbFloWHA2SjRz?=
 =?utf-8?B?YTgwQkM3RFZ6eGZ4eks5RTFkZkowZWY3cTFqTXlGcGpZQXlzcEZzbnFSRkFS?=
 =?utf-8?B?NlZCTHBFanFGQlZaeExyOUV2aTg2R2dnRzRVZmNQbmlLbXlyck9PTFJUcWRK?=
 =?utf-8?B?ZFcvY05xL0hadmU4ZGhDdXlpWFhnZXVrVVN3Q0RndTUwazlwK3Y4T2hsNFlK?=
 =?utf-8?B?dDhyNy9xVG1BTnhKNUUzdkdrZHczZ3hLcVBSckFZeWpONFp1a3Boc1RpSHEy?=
 =?utf-8?B?V2piME9KckVNNFhOT0pGaHNNbVVnUElHc0FlZGw2Slk3UTl5SWxTS3VQZVU5?=
 =?utf-8?B?TGFsZVRKUXFhWCtYc1YwekE2UWFzaXp5RlJ3UzlRUTNZWUxIbVpTcW0rSm9h?=
 =?utf-8?B?NFZBd3VJNUNJcHBWbC9ERytqbFhDREZQNEdQb1FIY2EzaTlQTDNJaTZyc2hz?=
 =?utf-8?B?M2IwQjQ2MVRiblNEZlNqVU9PZnJCbUlpZm4vV1BWVUJGcy8veW1QdkRzM3Y4?=
 =?utf-8?B?U1VITXdDTVNJUzdqYVlsRTg1eTY4YU1naG5uRjloV0xSS2Y0cmFlSjU2dGRs?=
 =?utf-8?B?VDNUQWZYR2RBTzBNaXBQK0lEbjVKM0UyQmsvMCtjY1czd3E3ZXVvZUpDZWxs?=
 =?utf-8?B?dHE3RzY5THN2SWRVSERlaGZ0d3VrUkxodW1PaVo3dGdyY2J6QWd6SHNlUkhk?=
 =?utf-8?B?eU42ZHcyOWY1TWViaURKN0pveTlYbGk2a2wvcTk4WEZDSWRnS2lCYjJYdXNH?=
 =?utf-8?B?RTNHWmxCM1B1YVRjSTJ2RjFtU3hFbTJCUk5vMU1pc1J6dXVlc0lla0RNWU5k?=
 =?utf-8?B?aDRFUGlkdmRuN2VOSWZyTDRnd25hbnMzNjZocUxZa0k5VmpQVzVWNzAzS3h0?=
 =?utf-8?B?VStkcFNwbTJpVm83RU1BbXlEaDczMVhMSGZFbm54VnZlRjQ1Zmt4QWpaNW9k?=
 =?utf-8?B?ZndIZnNOUVc1NmF1c0lvOE5ObEJVKzVKQjJyWDkrdEY3cjZkaGo3OGFSUy9h?=
 =?utf-8?B?ZzBQK3JDMWtIaDVLaGU1dDV4a25HWXRHalZ4bk84akhFMUE4S0tYK2I5bm9M?=
 =?utf-8?B?aGoydEVoS1MzYUtIODFlREpONlJFMU9RRU1CaE9yZkgxYWpISVN5Z0lla2dw?=
 =?utf-8?B?YnRodjYvOFpHcTZNZXdWQjV3T09HcHIycWV2VEF6TFNGRXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5861.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmIwcWRlT1Z0cDBwcVYySEpEZ3RmM1FnaHA1T3EyRk0waEQ5ZUZXTUJyT3FX?=
 =?utf-8?B?b1ptdjZwdHV2eld0eDY5Q0k0K1ZJYlVwR2RqcHZxZWFoUzlPMmdVZm05VVVo?=
 =?utf-8?B?bW03aVBrcTMrOXVrbXNOV1ZlVHM2YlVWd3NNeHZtd0tOQm45OU9WQWtKS2kr?=
 =?utf-8?B?Z1VnY243N011SjlUZkJrVTJQeWJxTmd0ZzU1aWpQNUVodHVFUHhNcFgwVytW?=
 =?utf-8?B?MkpoWUNRL0gySVgxbVpKZzJMOEhzU1pTVUFoaW9GRno4dHlaclBVOGl4eHpr?=
 =?utf-8?B?KzZTVGRGVHptY3dqeDd1OGNTTnc3WGtIcnRPdVB1bjVvNmRJdVJBTXBJTVdj?=
 =?utf-8?B?NGVHaEF1dm12c3RjQ3lNZWdGSEI5UmUxMkR4SzRqcU1jaGgzWlJpUXVJVmpS?=
 =?utf-8?B?U2wxaWxHaTdzOHovV0xRa1RkY0NGanJhSVVnUnNadU5nRFJaY3lIVmdpWHFG?=
 =?utf-8?B?Rk1QeE1XNWFKaDlQYkIyYlprTnlIblUwenlTb3ZzZkpScWkrV0ZGRUFhMVRL?=
 =?utf-8?B?djc2TzA5MkR0TkZVK2FNRkt1YldST1hwUGFxaENhbEJhTUJZMmhpUnN4eE5m?=
 =?utf-8?B?dHpIOHFGMDhzUUlyQURGYml2aXVGeHJ0dTFpRVlnM3ZWcDZYSGFndTFpcXhk?=
 =?utf-8?B?YkNvYlM0aDhWblNJNGdQNTgwZ2ZiNFgxS2M5VGQ4RDN1SWpTUzNGYThKYUtq?=
 =?utf-8?B?Rmw2aElXYjh0a1dGR0ZtM2hiV0dNOExhMyt2WkR5NUpjaFNWT3ZHK1E3K1VV?=
 =?utf-8?B?UHJZZkJadzBjamxOcURJdDIxRms2a0xGYnVjOWdHclBZTFlWRjl0R2pnWUhR?=
 =?utf-8?B?cGU2NkZTMU5xdnBvRC9sRFZrTldDRVMreU5mZDVISE12VEJkUDl0dEtYYm5o?=
 =?utf-8?B?OForWktVdWp0d0kxNTZ2OVVRYjB1ZkRaNGxkNjdteUpHbUtOOStMTFBqeUFt?=
 =?utf-8?B?L2NaaXRDVSs4c0dwUkJlOVBjYlNzSnlZOTlaZEdRblVKRmZWR1VwbTJKaDlE?=
 =?utf-8?B?UnFDNEN2ekpxdUVGTlZrbnVJcFNLMDFjNTRiWFg2bXZibVpqME5GNlg5YmNV?=
 =?utf-8?B?Q2xiWGVFZEJQOEZZRTNjcjdMbTdaUVVqK0ZTTkUwdWJXOWxYdEovZDBJdDZr?=
 =?utf-8?B?TlNFRXNPM2lieHlvY3IvL1UzL3k4Qy9GTGttTnRMOWJUeTRHZzAwS1lNYXN2?=
 =?utf-8?B?NTdCbmUwWEtNM2s4NjhqNXk2LzRQbnZyZitocHpsTk9yVEVvUlZkYmxabzh1?=
 =?utf-8?B?TkRSNEdISkVrRGMvakRhTlgyY0NYcHlmRlNrc09zdlVGM2VmeTY2SFN3ZHAv?=
 =?utf-8?B?UUlDQzBZV3NOdEsvRXFwT1VFWWhXaGM1RXZlRkZOcEVnaUc0T1hKblZ1bnBX?=
 =?utf-8?B?TVZUdG9FL0lMQlhiNmpvL2RaWHlWZS9yaDI2Mk1iYWtHbjVXbkgva3FzTjRO?=
 =?utf-8?B?VldCbWlhcURMLzVJdVRKYlI3OUNabzUvWWx6dk5KSmtlaFNkTmxvUzNjSWM3?=
 =?utf-8?B?SXE4YmpqY1gxeGFDRGJqVFhZcjJqQUVDWGVVL0FrR1ljM1dzNUczWEgzMUFZ?=
 =?utf-8?B?cmxpVFNDd1dDMEtsRllSQ2h6WkRWZFc3V2dJRUdKNEdLZTZNYStWUTJiQ3Nq?=
 =?utf-8?B?UCsvQ256b2REamRrdHREeXdLYS94Y0crcDd3RjRUQXM5N2NmS1hTQWZ4cWxO?=
 =?utf-8?B?bkhDcVBIWS9jTnNLYjJ6eFNYUlFzY2d2UkJmWkFpR1Raak5kMTRVKzQ4N3Vh?=
 =?utf-8?B?cWNOZk1jUmhsQnR5emh0UDg1QU52TGNRK2wwNDB5RTEzK3h1c3hDV244U2Ew?=
 =?utf-8?B?T3EvWlFzd0FQTXlLeVI2eXdvVWxOUENqUThTdDlaUlo4dUF6MUVRWkJiREpQ?=
 =?utf-8?B?NWZhWE4rSlA2NklYQWJPZVdiK04wRm1HREU2aHg5Y3pkUWNZR1pXQU1aUVBs?=
 =?utf-8?B?TmY4ZmpEZEdJZEpnTm44aGdtNWpVY25CVzN3blNpaGsreExqVy9HYmoyazZG?=
 =?utf-8?B?eXVSd0hWQ3pCL24zWnBTeVlOK2p4d2pFTHN2Njh3VFFmc2NFRkRHN1VGY29i?=
 =?utf-8?B?eDI1UWZpOGJUWHJ5Nkx5NEViMmRzYXdiMlpBY05jQWVxM0VnTHRZZmd6d2tz?=
 =?utf-8?B?Qk1aeCt3OGFLQ08yT2pOaERwbmlXRXIrMXV6MnNBc1FGT1VyRWl3RGpoYlpU?=
 =?utf-8?B?MVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CB00AC465636D488BF7D377F4053562@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5861.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 032eb09c-35ae-4cd3-968b-08dcd1999a31
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 13:08:02.6348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sCi1muW7IFnfy8oM56+AyPkaPTUWU5/Kd3E6bG9Oss8ePi5x1ME0CBBLCggIIpw4LYT6GEDgc2PzHZ6kI6HpQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4733
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

SGV5IGV2ZXJ5b25lLA0KDQpUaGlzIGlzIGEgcmVtaW5kZXIgdGhhdCB0aGUgTEdDSSB0ZWFtIGlz
IGdvaW5nIHRvIHVwZ3JhZGUgYWxsIERVVHMsIHNlcnZpY2VzDQphbmQgZXZlcnl0aGluZyBpbiBv
dXIgY2FyZSB0byBVYnVudHUgMjQuMDQgaW4gMiB3ZWVrcywgb24gMjMuMDkuMjAyNC4gVGhlcmUN
CndlcmUgYSBmZXcgY29uY2VybnMsIGJ1dCB1bHRpbWF0ZWx5IG5vdGhpbmcgbWFqb3IsIHNvIHRo
ZSBwbGFuIGlzIHN0aWxsIHVwLg0KUGxlYXNlIHBsYW4geW91ciB3b3JrIGFjY29yZGluZ2x5IHNv
IHRoYXQgYW55IHBvdGVudGlhbCBDSSBicmVha2FnZSBpcyBub3QNCmdvaW5nIHRvIGFmZmVjdCB5
b3VyIHdvcmsgZHVyaW5nIHRoZSB1cGdyYWRlIHdlZWsuDQoNClRoYXQncyBpdCwgc2VlIHlvdSBu
ZXh0IHdlZWsuDQpSeXN6YXJkDQo=
