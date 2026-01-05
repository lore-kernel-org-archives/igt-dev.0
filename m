Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53067C2A072
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 05:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027D510E1A0;
	Mon,  5 Jan 2026 05:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+4bR50K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5AC10E1A0
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 05:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767592666; x=1799128666;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XrK8OX2vroJzK0OgGjKPR3PJqhJI2hv7WtcWrhCFqj4=;
 b=Z+4bR50KBw/GunSnVH5c6qufcj60DON1AK6SC27/fnIUhWokNNoRAp7k
 7la7iZjoGvDZl7yGaJO2NdBFWgjq4Ajy4sLeACUKtdAzkQCTbzHkexGJa
 S02HUsugN2I6QBouSGW4E99kYnjuIPVQ0cFx3ebVT3vJ1Kp/s2O3naFzU
 yG6lezOkfDJq6M8275JmlOWInOzE4kIYnW21skPZBabKMmeZIckiLHQoQ
 QOvP9j6Gtc+JwKjH+IItd6FEpEhft3THB6YyUdjToW4ym1s7VR8xO+gV6
 tYCmpHWMIWX5bgzG+vEVMCjvjb9adEzWJPoKxoHQzL8Q6okpwsIUXuvLW g==;
X-CSE-ConnectionGUID: KTcCbqlAQfWQrbnODtXrsg==
X-CSE-MsgGUID: VMgwdevGQIamnHXBPHBeLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68862413"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68862413"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 21:57:46 -0800
X-CSE-ConnectionGUID: TbxtnSWoRKGgxNr6OBdb3w==
X-CSE-MsgGUID: fU5YJfCdQB6TJIAINa6TAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="203283841"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 21:57:46 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 21:57:45 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 4 Jan 2026 21:57:45 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 21:57:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6BuyGWNDLTTiw9x/bmQIFo4jtS0qfb0GJPecHazT6mF4RUy0W4axGzEtHo7HQ2ZYKAthqCJwxGDmKX5oGSaXnc6ZveL1AfEwyzAfx5cqoXvPJVpTnHXd1Sx7WRuvJLELQhsXj7vK8vabC77922YAQm3OQkVnAqjvtiNEa0ZkeOrK7r5dCe6c6TflrXWU0YoPoNLGg3FiEIBeDxKeURn1IBuCnZBd62T+C6EYNhL3TvINQOMz75CvKB9T2KMAFf4ESAS9nwJWtVr5+X+ZBt+kAZ4sjRURlk4B1wpGyISHb7+YToKUccrEMbUQLwyyCQ8iZktlCxrMs+L6PhkJB2VdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrK8OX2vroJzK0OgGjKPR3PJqhJI2hv7WtcWrhCFqj4=;
 b=amR9UX791CkxnZ/JNHaz6gAsaNACGMTFXXAfrYs/G/J3PkYl8C0ElksSZRMT0PWzj2G4bAQn8/RgtcLp0wLIciC+0Vk8NQjE/lojL8OrgVj9B+DyOPGOnMEuQr6Tlvreqf+lzjJzZOF7y/NIDcMCbOl4EFfk7/RAkhRVT48YZfGRcBG77hxZGX/i+IyEN5BHcGhcR57HXtnHXr0W6NhSKV1tI6tbT5C8QUS+GnflrWuEGM0JgIzwzmwD/KJaG1B8V4Ms+djoEd7qCwxjSlwlZ+HuB3aufwRIzAl94yExpQ66EDdv9crVDo5ixjmPkvp1IQxtfZ/1TwRnIns0y4kV3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by BL1PR11MB5304.namprd11.prod.outlook.com (2603:10b6:208:316::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 05:57:44 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::d721:2dc5:b225:7f6d]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::d721:2dc5:b225:7f6d%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 05:57:43 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gurram,
 Pravalika" <pravalika.gurram@intel.com>
Subject: RE: [PATCH i-g-t v13 01/11] drm-uapi/xe: Sync with madvise interface
Thread-Topic: [PATCH i-g-t v13 01/11] drm-uapi/xe: Sync with madvise interface
Thread-Index: AQHcffflgkyZFYq9okmVhvS89ajUGLVDFDBw
Date: Mon, 5 Jan 2026 05:57:43 +0000
Message-ID: <BL3PR11MB57475057EC84DC8FFA80E40CD086A@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20260105040000.181183-1-nishit.sharma@intel.com>
 <20260105040000.181183-2-nishit.sharma@intel.com>
In-Reply-To: <20260105040000.181183-2-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|BL1PR11MB5304:EE_
x-ms-office365-filtering-correlation-id: e96ee88e-589c-422c-a36f-08de4c1f5810
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?Q0l2dHc0U3hBRDRRbWx0akUwT0NJb2VvLzdPQXpIbG9hS2NIR0J4cDN1NEJt?=
 =?utf-8?B?OVNrUk5MN0tNbXpld1FvV3VqMGtoMDVVYjJrNEtJRTBMRnBMQktXdE41cTF0?=
 =?utf-8?B?Z29VN0N4bWs4cFFXc2VHTkJobWozUUdZNThOUUhmNTVFTk1LQUxDVTJqb3p3?=
 =?utf-8?B?RjMxM1BjbzgvSWFUV21kdlFPeGdmUnJWVVNlUlJxdTR1WStzOXk5U2hEU0g5?=
 =?utf-8?B?d09DYm1nTzEwV2VQUVpuendFcm5zRkh1VlFqNW15RHNkT2s5ejIvSjVXalZy?=
 =?utf-8?B?ZVA4V2dxdGo2QW1aRjcwT2h3a1FCdmZmSGRLdk5XS2pkZjVMbFl6cmlFblgy?=
 =?utf-8?B?OEd5WkVDbGN0T0VHYndlcUdVZkFOOGFjM2l1VHRJZDdjSEZvV3FpTWMvMGNv?=
 =?utf-8?B?TmZ0TG90aTY5OVRPbzh2NWorRjNaQS8vUlBSQTdPYzlpWG52NXpJL29rNTBC?=
 =?utf-8?B?QlFkQXZqRlhWMDF6SytSeTF5THNKRDdGYk5iNWo5cXFZWEs0ejVEb2FEaGVl?=
 =?utf-8?B?VytYWk1NU2hPOU52K25NMEpNbjMrWk52NmVWK0lUNzZxNkp2ZSt5aDVaMDR0?=
 =?utf-8?B?TGFCSUhnaTVTUHZHRDRJU25CNjNCSkNCcjFGMk5MS0dadm1oQWRDL28zMUEx?=
 =?utf-8?B?Y1RJRWN3MGpIZkh5V1MwdjJyWnh2cU5DZVVuTGUrc3BhWXlLUnNrMjFIK2Zv?=
 =?utf-8?B?cVVETk1SWnd6UHJ4cTdqekpxbTFGYjdYSnhPQ1kyZ0Y1Z1ByeG1IcldUbnVY?=
 =?utf-8?B?NDRPSXczWlJjMXJXbGYzaHRIRWttVzR6Qm9SOUhGN1hHN2FOaTNGelN1eTV5?=
 =?utf-8?B?UFhiK0JaRjFuUno3RGJ5QWdxVzJNcVFrQjU0THNUWjV2Z2paSkcyTDdwTnpU?=
 =?utf-8?B?SHV5d2JmMlVneWNYS3B2S0dBbDlVdGRKOFlIYVZzV2NxajVWMmNscFp2MVh2?=
 =?utf-8?B?anpkUXJ5YmZZMlpVWGZueHVxK01BRS9VT3JsV0VwazFwUTI5MUlsV0pVbkFU?=
 =?utf-8?B?K2JMdWh1SWdLQkxWYnA1WW56QVcvdnNTSUwwVUtkVTNCY1J2M3hySFFwZ1F6?=
 =?utf-8?B?OHN2WVVJVHJLSk53MWFYbzRDeDZpZ08zbm44cE16cmg0ZS8ybnBPdjlmOFdU?=
 =?utf-8?B?MkVVbFpDSjcrQzNIcjZLMmRBa1NVWWhSQzdLVDFBbFcrV3lNcXBJOTRyeTlj?=
 =?utf-8?B?VHlXdm1BdG1lUWxvRFdoWXhPSEN4M0cxOEQ2dWNoRDhYbGdSN3VyMktsaE1y?=
 =?utf-8?B?RGREbVljcHdqTkl1OUxuTmNFSmVlSHA0YUlJd3lmSGU3NEZQdUwzSkt0Mnlp?=
 =?utf-8?B?MHgwV0R3M3NTcU9zL2JLU1JtR25VQmQwSkZOaGxCUk1RL050aVhLWktxejA5?=
 =?utf-8?B?MEJKWTcxQURmdEU1emdoUzhoTWVFclhHTWRPQW4zOHJ1aUhKTzNiTGtJR3JG?=
 =?utf-8?B?bXdXUm5zYkt1K2grNStsdGo0dTlQTERoaldOd05ZSHJzK0JPRUQ5cnhuYXBq?=
 =?utf-8?B?d050VmZ4R3U0NGxPY0hYY1JyRG5NQ2pyOTJPL2VSSzN2b2wvTEc0R3NCcndo?=
 =?utf-8?B?SjNKMENjNXRpQVBaUUVhMGtTVzAxV2wrWjhjUzhNV2VwTFNoL2pEZkJ0YytT?=
 =?utf-8?B?ZDY5TFd3b081Mlc1VW1sZ2xhN1pIWVhENjQ3KzltdjFFZlFhMDRDVnR2VkNx?=
 =?utf-8?B?dWhheUdzUzUvS2xxcWEwSDlnVldKYWJPOU1zTjByQlJvL09jV0NaVjJtbHdl?=
 =?utf-8?B?b3N4aW5MbzdZSTJYcWZ5TkdLMEFqSEYxQW5RZktkb3FESEJjcE11Ukd4NTBa?=
 =?utf-8?B?UjFZajMwKzBjL2p2aFJ6MVZHZkV0V1VmNWdzNGEyNDBwajk3NlhwSkFuWUgy?=
 =?utf-8?B?ZlNKRlg1cnBOeGsydGlLSThvMW5zVUE2THBzVXJJcy9pMGd5K2pLQVI1LzB4?=
 =?utf-8?B?cG9yb1RiSHVveHZpMmVocjlrSTBxQi9ERHdLc1ZXOXgzQ1ZPN0VzS1FnK01Q?=
 =?utf-8?B?YzhQTWdQY3I2cU9NeTZEcVdOaWNTL3NTNk1YRkM4dlI1NGhlMlFyNHVmeDVO?=
 =?utf-8?Q?YLO5eX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVFvVGR4MTEzMGQ2eGFuQkdlS040MTN1M29JeUI5OVhyY3crOHMyOHp4WFRU?=
 =?utf-8?B?bWZjK1Nnc0QreUV5YzF5cXdNQXpMdnFjUGsyVWNhL1czYnlqbjNnTjBIbDQy?=
 =?utf-8?B?VEdkc0JoWHdaZ1E3c2J4bEZsUThyaXVuaVNiTG9uSjJoQVl6UDdGS3VZM3ZZ?=
 =?utf-8?B?RENEQnpHL2lseDFvTFRJSzdmZFJUb2lRdnRPcnpPamFJSlFSMmhWNHlxUWph?=
 =?utf-8?B?UjAzYzlsd0ZzZ3Z0cW9kU05Wc0JKNG1FYmN5MElsNUxidDV1U0VFckhiSFZ0?=
 =?utf-8?B?cWtTOXJCaDdDNUdJbTlUNTRpeW5icldScDZGZGpGQnlMNWZCakJ2ZEVPdkx0?=
 =?utf-8?B?U0hIZ1JzeGRFcmoyQWdkbnpvTmN3SGs4MVMwUW4zN24vVmUyb1BSVkR6RE1Z?=
 =?utf-8?B?QytzQURiZEg5NWpsMERpVUN2NTZHak5wZmhwNGd5SEg4Qk92SW5CdHlVbTBB?=
 =?utf-8?B?YzRKSG94M2JHc004TExGVHE3N1h2cDJpTldlU0dVWUswWmFBQ2FsK1pHdEMz?=
 =?utf-8?B?Sy9SV0dhUGtDeFQrUkczN0pzaGNPZjRGTjlBK05MVTdmaHhmUHppd1ppd3ly?=
 =?utf-8?B?TUxaenZlYnFIYzNRa3lhdkkzMlh3OTFTUUIxS0Z2eCtJRFhSanA4UUc3Wmxx?=
 =?utf-8?B?TUl5QkFVWERqWXdrbEkzY0ZTVFdRbFg4RlJJek41ZnczdWNNTWV2M2pUcDV1?=
 =?utf-8?B?TVpLUVVpd1pLN2l0UWUrTTdEcjk4QTlBK0VyQnNyTEFFWXEvZGlkOGREbjBu?=
 =?utf-8?B?ZHh0VDZsaXJQZ0ZQbFZHQTRKNVRQVUZwSm0rVVNJNnNjbXBRYlBFdDBCOGVY?=
 =?utf-8?B?S1djNzJoUisrMmM2RVhObGM5VEpCSzRFYmZlWTM1cnlici94OTFtVEFLSHBv?=
 =?utf-8?B?MWJoVFNkbmFkcU9yaGxGQUJpU3hHajBxUTdkSUZTSEprenFxdUhySVljWVNz?=
 =?utf-8?B?azJ1ZmV2a05ERHRyNEdiTHlOa2lIN2wyWm5sL2wzOGZhU0U4OHZsOEFTeVlK?=
 =?utf-8?B?bHloTVc1VVJlSVd3RjdzY00rRUxaUjdHRmFxd3JnUW9ENG5nQlIrb000VHdp?=
 =?utf-8?B?eG0wZmhPT3dEL0tpYXBSWHRRMlBTT2N0MFJUV21NaXpldURHQ0RCRFAvbXNS?=
 =?utf-8?B?QXZjQUxaTmZyb25lZGpXZWE0Y09sS1FiYVhYaDRxWStUOVprYXJFMk5TRXN5?=
 =?utf-8?B?ZGEycHdOenhMN0NsdDRNWEpwenNsN3VJU0h3dWNkdmFDdGtwMXNpM0pMZkFU?=
 =?utf-8?B?aGtDVnRteTdRT2x5OXNtd2N4MHZNejBtdGQ4ZDRpWDdmWmQ1NmtTdFJpak5P?=
 =?utf-8?B?cDRrWjloVXRheWRiTExmemxLTUFRYWI5NERzRzNoaXN1a3AweWtxQU8wYWho?=
 =?utf-8?B?eVVtSnBsTjdObGpORTNFS204TkpJSGdsZXFpU2dqMVNYQm1VNStOTENhMXVU?=
 =?utf-8?B?WFN0UXZwZXFPY284b0RaU21haWY4THk5WHREZko4T05WbEc1enBtL2RlUG9D?=
 =?utf-8?B?QytTOFhnaVdDNWRUOSs4Yi9qT2dyTEltQWRqVks1MFhXZ0FzMER2a1dpb0pB?=
 =?utf-8?B?Y3EzU2VLaDYwclZRWS9rSGpiYUhPUkdGZnltb3V0QXYrN2xmdmJuOHFUMUt4?=
 =?utf-8?B?QUQzc0lBN0d4VWljZjE1VEcrM01vcnQ2WFVmUEsvb0JYNzBJQ0ZmM1hJVy9G?=
 =?utf-8?B?c3E1WEVETjZmMmp4SkRjWXYzYmwxRzgrU0N6dEJhYytEc2gwVlNTQXlTTEVY?=
 =?utf-8?B?VTlhYU1mSktycWpOSkZMcko2WTkyZG8wQkdkVE85TXBjSVFvQmErZGRxWis4?=
 =?utf-8?B?cHBGS1lmcVA2dytBdzduUjhDbUsxOVUySVdxQXRSSTBsTHErUG1POVRXaXR6?=
 =?utf-8?B?REJReVZNeCtQR1BGZCtiTmtXd2ZjUmNEWUVkOU9ENDR5TXo2dmw4TE9uV3BG?=
 =?utf-8?B?a1czK1crOHZxRUlqdUM4RW9nUk9DR3dlSEYzTVRpRHQ0L01WL1hjZ1dudmtL?=
 =?utf-8?B?VWdIRVhqWWJoOXdwVkNsdjNqdUwyY1V5dC9oMGxMa2dYVVdUbmdQSHVWMVM2?=
 =?utf-8?B?MFMwODcvVTBqZEpUaUJwSVNDREM1Wm15RFhJT1JDQ1NrZllTMm01ZENQUkRL?=
 =?utf-8?B?c0h2ckU3WUUxTWN3Mm1ObFZZaWZIK1huZ0lCbXhqZ2trZnZuNEtEOEh4MnJn?=
 =?utf-8?B?OTZCdENnWVhLUHM2eE9oREpqRUVzK3dXcUxWZit4VDY2MTRIQUxDWmNTRnZX?=
 =?utf-8?B?N3ZtRGRCZndRY0YyOWZUSEU5MU44bExsN0RQNWREQzl4dTY3cnR4bTZhRmts?=
 =?utf-8?B?RUZ6QUEzVFZmVjNOeVJuRkdtYWNtK1VVQnQ1S3FwWGZ6cWp4SFFzUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e96ee88e-589c-422c-a36f-08de4c1f5810
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 05:57:43.8017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9V2tjFMVJWWWFoAbvm58KQ21ZvJKemaDhUgALO1kTmrStOdX/j9sYzCzb3/LBn8pooRtT8MtTDazcwjdsPLcvw/3jC88m3KWtnQmd8dQnhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5304
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IGlndC1kZXYgPGlndC1kZXYt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPm5pc2hpdC5zaGFy
bWFAaW50ZWwuY29tDQo+U2VudDogTW9uZGF5LCBKYW51YXJ5IDUsIDIwMjYgOTozMCBBTQ0KPlRv
OiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgR3VycmFtLCBQcmF2YWxpa2ENCj48cHJh
dmFsaWthLmd1cnJhbUBpbnRlbC5jb20+DQo+U3ViamVjdDogW1BBVENIIGktZy10IHYxMyAwMS8x
MV0gZHJtLXVhcGkveGU6IFN5bmMgd2l0aCBtYWR2aXNlIGludGVyZmFjZQ0KPg0KPkZyb206IE5p
c2hpdCBTaGFybWEgPG5pc2hpdC5zaGFybWFAaW50ZWwuY29tPg0KPg0KPkFsaWduIHdpdGgga2Vy
bmVsIGNvbW1pdCBkZmY1NDdlMTM3YmUyICgiZHJtL3hlL3VhcGk6IEV4dGVuZCB0aGUgbWFkdmlz
ZQ0KPmZ1bmN0aW9uYWxpdHkiKS4gVGhpcyBpcyB0byBicmluZyBpbiBtYWR2aXNlIGludGVyZmFj
ZSBjaGFuZ2VzIGZyb20gS01ELg0KPg0KPlNpZ25lZC1vZmYtYnk6IE5pc2hpdCBTaGFybWEgPG5p
c2hpdC5zaGFybWFAaW50ZWwuY29tPg0KPi0tLQ0KPiBpbmNsdWRlL2RybS11YXBpL3hlX2RybS5o
IHwgMjYgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+DQo+ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
LXVhcGkveGVfZHJtLmggYi9pbmNsdWRlL2RybS11YXBpL3hlX2RybS5oIGluZGV4DQo+ZjhiMjI4
MzUwLi5iYjY5ZjliMzAgMTAwNjQ0DQo+LS0tIGEvaW5jbHVkZS9kcm0tdWFwaS94ZV9kcm0uaA0K
PisrKyBiL2luY2x1ZGUvZHJtLXVhcGkveGVfZHJtLmgNCj5AQCAtMyw4ICszLDggQEANCj4gICog
Q29weXJpZ2h0IMKpIDIwMjMgSW50ZWwgQ29ycG9yYXRpb24NCj4gICovDQo+DQo+LSNpZm5kZWYg
X1hFX0RSTV9IXw0KPi0jZGVmaW5lIF9YRV9EUk1fSF8NCj4rI2lmbmRlZiBfVUFQSV9YRV9EUk1f
SF8NCj4rI2RlZmluZSBfVUFQSV9YRV9EUk1fSF8NCj4NCj4gI2luY2x1ZGUgImRybS5oIg0KPg0K
PkBAIC0xNDIsNyArMTQyLDcgQEAgZXh0ZXJuICJDIiB7DQo+ICAqIHJlZGVmaW5lIHRoZSBpbnRl
cmZhY2UgbW9yZSBlYXNpbHkgdGhhbiBhbiBldmVyIGdyb3dpbmcgc3RydWN0IG9mDQo+ICAqIGlu
Y3JlYXNpbmcgY29tcGxleGl0eSwgYW5kIGZvciBsYXJnZSBwYXJ0cyBvZiB0aGF0IGludGVyZmFj
ZSB0byBiZQ0KPiAgKiBlbnRpcmVseSBvcHRpb25hbC4gVGhlIGRvd25zaWRlIGlzIG1vcmUgcG9p
bnRlciBjaGFzaW5nOyBjaGFzaW5nIGFjcm9zcw0KPi0gKiB0aGUgYm91bmRhcnkgd2l0aCBwb2lu
dGVycyBlbmNhcHN1bGF0ZWQgaW5zaWRlIHU2NC4NCj4rICogdGhlIF9fdXNlciBib3VuZGFyeSB3
aXRoIHBvaW50ZXJzIGVuY2Fwc3VsYXRlZCBpbnNpZGUgdTY0Lg0KPiAgKg0KPiAgKiBFeGFtcGxl
IGNoYWluaW5nOg0KPiAgKg0KPkBAIC0yMTIzLDcgKzIxMjMsMTMgQEAgc3RydWN0IGRybV94ZV9t
YWR2aXNlIHsNCj4gCQlzdHJ1Y3Qgew0KPiAjZGVmaW5lIERSTV9YRV9QUkVGRVJSRURfTE9DX0RF
RkFVTFRfREVWSUNFCTANCj4gI2RlZmluZSBEUk1fWEVfUFJFRkVSUkVEX0xPQ19ERUZBVUxUX1NZ
U1RFTQktMQ0KPi0JCQkvKiogQHByZWZlcnJlZF9tZW1fbG9jLmRldm1lbV9mZDogZmQgZm9yIHBy
ZWZlcnJlZA0KPmxvYyAqLw0KPisJCQkvKioNCj4rCQkJICogQHByZWZlcnJlZF9tZW1fbG9jLmRl
dm1lbV9mZDoNCj4rCQkJICogRGV2aWNlIGZpbGUtZGVzY3JpcHRvciBvZiB0aGUgZGV2aWNlIHdo
ZXJlIHRoZQ0KPisJCQkgKiBwcmVmZXJyZWQgbWVtb3J5IGlzIGxvY2F0ZWQsIG9yIG9uZSBvZiB0
aGUNCj4rCQkJICogYWJvdmUgc3BlY2lhbCB2YWx1ZXMuIFBsZWFzZSBhbHNvIHNlZQ0KPisJCQkg
KiBAcHJlZmVycmVkX21lbV9sb2MucmVnaW9uX2luc3RhbmNlIGJlbG93Lg0KPisJCQkgKi8NCj4g
CQkJX191MzIgZGV2bWVtX2ZkOw0KPg0KPiAjZGVmaW5lIERSTV9YRV9NSUdSQVRFX0FMTF9QQUdF
UwkJMA0KPkBAIC0yMTMxLDggKzIxMzcsMTQgQEAgc3RydWN0IGRybV94ZV9tYWR2aXNlIHsNCj4g
CQkJLyoqIEBwcmVmZXJyZWRfbWVtX2xvYy5taWdyYXRpb25fcG9saWN5OiBQYWdlDQo+bWlncmF0
aW9uIHBvbGljeSAqLw0KPiAJCQlfX3UxNiBtaWdyYXRpb25fcG9saWN5Ow0KPg0KPi0JCQkvKiog
QHByZWZlcnJlZF9tZW1fbG9jLnBhZCA6IE1CWiAqLw0KPi0JCQlfX3UxNiBwYWQ7DQo+KwkJCS8q
Kg0KPisJCQkgKiBAcHJlZmVycmVkX21lbV9sb2MucmVnaW9uX2luc3RhbmNlIDogUmVnaW9uDQo+
aW5zdGFuY2UuDQo+KwkJCSAqIE1CWiBpZiBAZGV2bWVtX2ZkIDw9DQo+JkRSTV9YRV9QUkVGRVJS
RURfTE9DX0RFRkFVTFRfREVWSUNFLg0KPisJCQkgKiBPdGhlcndpc2Ugc2hvdWxkIHBvaW50IHRv
IHRoZSBkZXNpcmVkIGRldmljZQ0KPisJCQkgKiBWUkFNIGluc3RhbmNlIG9mIHRoZSBkZXZpY2Ug
aW5kaWNhdGVkIGJ5DQo+KwkJCSAqIEBwcmVmZXJyZWRfbWVtX2xvYy5kZXZtZW1fZmQuDQo+KwkJ
CSAqLw0KPisJCQlfX3UxNiByZWdpb25faW5zdGFuY2U7DQo+DQo+IAkJCS8qKiBAcHJlZmVycmVk
X21lbV9sb2MucmVzZXJ2ZWQgOiBSZXNlcnZlZCAqLw0KPiAJCQlfX3U2NCByZXNlcnZlZDsNCj5A
QCAtMjM1Myw0ICsyMzY1LDQgQEAgc3RydWN0IGRybV94ZV9leGVjX3F1ZXVlX3NldF9wcm9wZXJ0
eSB7ICB9ICAjZW5kaWYNCj4NCj4tI2VuZGlmIC8qIF9YRV9EUk1fSF8gKi8NCj4rI2VuZGlmIC8q
IF9VQVBJX1hFX0RSTV9IXyAqLw0KUmV2aWV3ZWQtYnk6IFNhaSBHb3d0aGFtIENoIDxzYWkuZ293
dGhhbS5jaEBpbnRlbC5jb20+DQo+LS0NCj4yLjQ4LjENCg0K
