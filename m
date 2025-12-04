Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14ABD29FB4
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 19:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9997E10E036;
	Thu,  4 Dec 2025 19:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBr0woAm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BD610E036
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 19:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764876246; x=1796412246;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AUlaIEJp38cBo3Nzeny2lxMJ3EPIjWk+Qdm/laU/dLM=;
 b=NBr0woAm10sXFg/PChSwgaFYpjubJ0PxWrZ8yo+35uU3fwaNyX3Zp5RL
 R8fTRCfMRlCSoT/Muvn5TzhZQXYmsj6Wrv7r7L5dWq67qU1GmbxMCJDw7
 7nEX1itGLqjp1cM/VTGVWmxwCvR0yp5Q6m7rr+GOsVLS2wkN57NsiJRUc
 Xd+wsMtzhBj+0zRRqs5aZoBT/9yPdetNgimdF0hIBAlIksA2usHNfyTLQ
 IKYngA9dXiBlcTpSoaAf9AmTbCoh50kphZo47w1+z02cirN9AJFZprJXl
 C28QGvbQPTC3/BzrThL6EGp3Kh8hJB4v+cJCeKXo1U0Cl0YIezcrpf+nG Q==;
X-CSE-ConnectionGUID: QTEaLmRUT++yxJAtyCz+9Q==
X-CSE-MsgGUID: Pe9Jz18KQ9+sglItFqCXTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66790769"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="66790769"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 11:24:05 -0800
X-CSE-ConnectionGUID: 9tscczZsSgOH9TUIwYrzaw==
X-CSE-MsgGUID: rDbTCNgaRn2j8KWMuXK3SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="225736513"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 11:24:05 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 11:24:04 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 11:24:04 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 11:24:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cx8QgBVvX3Cw9a3rGIc/VCTxSQCcZ6fCf27iRd8cBEb84JAjg5JUpKQCidX7f+lPQwiQTJVu4D0k58mmBIj4VKcdLDl8pU2OYbpzNE8VDRImWSfi8Dc/9GOWTPzdkJA7tnz0qZZfsYMlbfwA8tf3hNYPWO5sQqoIlVEYdzk3LLXlxd/3Bt+QbAjGlt+Iv4jbW5HZ0z38chW8fWuG9hqEkXZ002hzy0O43++pO+kbA7Xj9zeljnrtju9/n4iFRBaHkG8aUysBHz7zpvmxuC61UNfgWPTjf4BYu6fzGprTeCM2s82tq0PWhpEHXlvxfmDfUqnUvMKBFC1CBx6vjVDLjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUlaIEJp38cBo3Nzeny2lxMJ3EPIjWk+Qdm/laU/dLM=;
 b=qgz2d/9o4Y5/uohKKeJ7grczKi9+E9e3L+uPtR+Zb36J6HsI3AJbokD2CfoLBuB1wTvmfbPh+Nlt3nH57INCwKtIg+PkIEEn1pAOPRQEAGY/l3F6BFHnay+yeYQCoABBhjxIJEShZKEvj0hLNLDhPFqgoCSL+VcQcd60gX8ldcC0GhLvjPCMrWS6n5iVEv6uxcT8akoAc9XqcjPrEdXik2/HPNDZaaAbj/Mo+xmvuLo/xWpbmWWtnn/BB+5z46e6mTPPBnGp1cH4CyNw8YjGk35MPj9Wqky/SWuNMGCzkcIYXfkb/5Vw/rXneXkrwPe4g+eA5/Ss29jpBfE1ULxkLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MN0PR11MB6277.namprd11.prod.outlook.com (2603:10b6:208:3c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Thu, 4 Dec
 2025 19:24:01 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 19:24:01 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 09/19] lib/xe: Add exec_queue set_property ioctl support
Thread-Topic: [PATCH v2 09/19] lib/xe: Add exec_queue set_property ioctl
 support
Thread-Index: AQHcWpsH1yBmjJo4ekKApEPFXAQQ1rUR8d8A
Date: Thu, 4 Dec 2025 19:24:01 +0000
Message-ID: <4793ae1b81f967de1425ebdcb06962e8dc9df651.camel@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-30-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-30-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MN0PR11MB6277:EE_
x-ms-office365-filtering-correlation-id: 17474377-90c9-4bb6-9699-08de336aae55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?a01vT3hQTjJZaXBLZlF2bGpyOTVZUFEzeDNvRURsa2lsLzRId2NVaHlQWXZP?=
 =?utf-8?B?OWZseEhSeGxGMExtZXQvL01LYmcxSDR5L2l6VGN0RDl1OUp3dkt1ZkRtQjFx?=
 =?utf-8?B?THNDU3FUc1JyYTdVSHM3WVZXTUJhWlZyZTVWSFRONXFFNnlBTDk0TXppSjZk?=
 =?utf-8?B?T2tXdy9vL29QUTZzSEtQY05RZkdyc3k1L2kvUnlLY1pGZ1Y4ZVRwdVMwUGIv?=
 =?utf-8?B?OERSVXFmcXJPNE9nbTFmUWpreTg0ZWxYUzJJUUJldUJsbmw3Y0syb0xSNG1m?=
 =?utf-8?B?em9ZNmFKR1cweVJ2eHhLd1hJRW5XdCtuL0tRa0NXNEJ5TmtIRTBQMHQxc0gr?=
 =?utf-8?B?MjhFQnZ5blFYYU14eE5RV2JVOTN4VDRBK1RaS284U0FGSmhlaFRpdjdoUFZC?=
 =?utf-8?B?MUFLMElNSTJNQkdoQzQ1MEtXcGllbnNJU3BwR3k4UVJlY2VGdStURjhRY2sy?=
 =?utf-8?B?Q25WMk1hUURHRy9YOCsyL2FESzNEQ1F2SGh5cktoVFhsVkRjQzAxdTBidU1k?=
 =?utf-8?B?TVRIT1haWTNKZlFWdXcvL0tFR1hmRXo1d0dlUVBFYWs1ZWJ3WVREY0VOSTZm?=
 =?utf-8?B?VmVRRW40Q0xvRGZZdVpKdGVFUnZtd1VZWjBMcHFYZVR1UThYTFpYM1A0blJi?=
 =?utf-8?B?cWpHU2hDS21OQXU2NFMyNzhsR3NyTlM0K2phYyt1aXRvSU5RRjZJaThUUmRR?=
 =?utf-8?B?VHNZVzMydkJDWXVZTUlQYlova2FtUWJ6VFl5b0NPT2pnL29zQThrTFVVV2hE?=
 =?utf-8?B?VWhFUHh0ejQ4cW1KRUNoN00zZzdBSHJzc0U4MCtiZXlCRURPYTZTN0kreWlN?=
 =?utf-8?B?VkIxMTh2cVE5VXdVblBPMTByRUdycFYrOEpKQkxvMEcwZFpsekIwdmhxQjBx?=
 =?utf-8?B?ZGdwTGRaY0F4VnVoTlBDZXd0RldSWmhRNUYva25uQnp4bk1kdEJ4ejlTL0tw?=
 =?utf-8?B?VjMyNlJjYWQxNkdVOTdIcEdGWUhsTFdqZFJpb3VXWlg4ODhvMmVDSTlDTE55?=
 =?utf-8?B?QUNtNXF1MitoMDJLSmRobWJnUUU4aHZnUFpORWhoK3VBblBubWlwNWJKamFj?=
 =?utf-8?B?aFd0WFFUck1lWFF4dExaQ0VRMTF4WHlwMC94bnR1ZG05Q09vVkRqcUJOak5X?=
 =?utf-8?B?NVBQQVhsSmJ6b1MzQkNuTEdQSGVPck1HZmVJSXRLZVVnRzhGT285UytpZXcw?=
 =?utf-8?B?NVJBZ1dESldNQklEOVJxdkVYajliQThhUlJrOXltSGY4TE9WREdFYmxRQnN4?=
 =?utf-8?B?b0MySEY5U3lWM2Z1TlF2Z3dENnNPd291RUU2SHZzeUt4TFdPSnpsU29qRGdY?=
 =?utf-8?B?TEp2OFd5TDByQ0JrMCtCVHhCVGlJTGlFVVJjTmgxTjgwWFhTUGdDbExlMTBk?=
 =?utf-8?B?bHg3a1BYc2FQa1Npakg3bytscVhZdHM2VEp6dGRPZEdMdmtGQzdCdnY3ZDNV?=
 =?utf-8?B?UnBSRC9TMlBMWVhSVmdyeXFhKythSzMwcTViWWRmaEljKzNOWWpSbXZxTkt6?=
 =?utf-8?B?VUM5Tlk5MjY1Ry9RVHU1akhrOER1TkIrRTd2N2xEbmxMM1pjbEhWSGtpOEI4?=
 =?utf-8?B?b2syeGJ1c1FEVWI1NEdlbDc3YUVPcjgyRkt3WHdGckpaeXJXbis1cmFrZi9T?=
 =?utf-8?B?VUFucVk4cERid1hlblgvLzZBVTJmUzMzWjk2Ri9FVlVlcndNaTFLVnhoakh5?=
 =?utf-8?B?aFBld3k0b2NPRjhZTkN5TWhnUnI4RkxBZlhiWjlUYWU5aEdBWnl1anRCNGtS?=
 =?utf-8?B?MzZ6Tktvc1lVcVN5VXBLWTJtbUpZbURIMEtQZHFvK2JwdlA0cjlIQUZMZEZV?=
 =?utf-8?B?ckRZV041KzN2NXFEOGd2NjZ1SjUzUmFJcFlQaW52ZG5QRUxSeUxYK1Z3cHZO?=
 =?utf-8?B?WkdjYzVva0FRY0ErdTZ0ZzRJOG41TWwvc3V2WCtyMWxCU2NSblE5TjhyUUlt?=
 =?utf-8?B?OTA5VGhUSWJsTWdaNmJ4VFkvM2RBc2FiRTAwQjVhanRoQ2p3VnpKMEJVL0NF?=
 =?utf-8?B?eEE3b2cyWWNIUUJQNUg4Y0h4U3ZYb1R4YWFjNzZjR2sxS0pZMzdQRkw2Y3BG?=
 =?utf-8?Q?wGqKuw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bksvZVZDMElLSTBNSUVhdlZud0RhQWFNcnZYN0RSU0MyVlBoRVVnOWZFYmU0?=
 =?utf-8?B?MDZ3eXZOU0VqVU5LT3gwcXpKNFA1N3BpWHQ4dDc5T29weVhWSlZMaG1wa3Nl?=
 =?utf-8?B?WUdwZFIrTkw0ZjV2L0REWk5CdGw0bUhKTmZueHVJdWhYMU5NaWY3bkVTN2t0?=
 =?utf-8?B?SlZ6eVE2SDI0SHlqV2thbjFrejkrMS9jYlBteUlLYjZWRkJlb0NWdE5oWUVa?=
 =?utf-8?B?c21PSTJwdFVQZ2I4YXpYWVVMWGdiZHNqUzYxUFJpeFhkcHRybmk4UXlvVjdB?=
 =?utf-8?B?U3B4Zks2R3I4c3h2OXpZK3E1RTlNYnNBVnVVUXdCdkoxekdwVmNpbXdMRUpm?=
 =?utf-8?B?VzJQRlowb1lLUGk1d1FaWFN4ZHBJYzIrdUJiak4vK0xmb241NTE3ck9aUU5T?=
 =?utf-8?B?ZFYwMWR5SGtkczM2U3BvQlBOR29jWHhuUDdoa1FleVh6TlNXU0dCSi92clU5?=
 =?utf-8?B?blhhK05ReEI4S293YTZ3Wm5NM1RsL1hkZFYrR01NYlhVeGF6b2JlWlEydmF3?=
 =?utf-8?B?NlFLV0c1MldUeHd1bWVIV0dERmtodTVYbExuTit1aTZjRFZyNjI1V1QrY2Ns?=
 =?utf-8?B?ZVpKdmNLWVc1cFhIK3dyTmFkSXk5My80TkcwZnY0eklBajFjcHpDSThBU0FK?=
 =?utf-8?B?UzFYV2Jaek1mT0ZOd09NMEFqNlZSVjdpS29EbHcvTGFWR3RML29oZXhZLzha?=
 =?utf-8?B?RzRIMDdVQVRRNkpSWk00ZjE4QUxiSFdGSGppdXR5Zk5iczdFL3hUdk8zdHN0?=
 =?utf-8?B?MG5kd1l1OGlFTSt0aHNSZmNuY1pxMWUzSWpFbHBjV3VoK0gyZXZJaWl1dHFu?=
 =?utf-8?B?QU9EWVFrbGNvb0xEeTZGT3dLTE1JZEhWeEFwcTQ2NG43RHM5Zk4zUkE3Ym9v?=
 =?utf-8?B?c2xldElUUjZwZGhxYkcyTWE4aG4wWVNlVTVQK1BJSTVVYnZscWRNcDlDMkdQ?=
 =?utf-8?B?akdhM0xIdEpyak9JVjBOcm5WZVN4aEw3ZzhXLzUwemxtTjcvbURpckQrcURk?=
 =?utf-8?B?bWNlZDBoOWRYSTdXMmx1QkgydlZBUDVvRk5GWXZCOVVreUFCZUQxZnJlcXpB?=
 =?utf-8?B?MFJhV0hMbzl5anVBUTBEVzQyZUxyMld5b3NkU3VJZEJCalJTN2k4cFpqRkg3?=
 =?utf-8?B?MW5hVm9MTmN3K3owL1FwT0s1eW90cmFvSFhKMm53ZmlOU295Zlc1S1N1bWtm?=
 =?utf-8?B?QWRtV0plOUVmYmRQUEE5MVcwaFM0Q0diWGxlcHllak1TQjFhbTAzWmVNR0k5?=
 =?utf-8?B?dHZvcXVrNVJIQlpSNnNTdnJPenpmSHFZb0l3TzM2eWZad3hOYklVSDZodEdo?=
 =?utf-8?B?cUM5bkFWUlJWNG51RDhFeDY1QWhtYWxkY0pNcmV6WDdTaVZlbFp4T2ZLY3Ex?=
 =?utf-8?B?RkpDMEZTSGZhWStYdkl1Sk42b2Q2VXd4dmx5RDVoZi9YSVpFSmw0bzlMY0dN?=
 =?utf-8?B?SUlZRC9YczJUY0RtRGszU3duclljTjhRRWN2VjRWQ3dwR2k4c0FTM2ozQnhW?=
 =?utf-8?B?Tm8vYWw2VjZ1RTJPM2dyS0ZSelpMVUZaWHZ2QVJkR01acWI4dThMYWdXYVdT?=
 =?utf-8?B?OUZJVDZUYXI0UlpMY0dHaTNNY3hiSDZjazRIMW00UUFqeXM4MEMzZGlRaWl0?=
 =?utf-8?B?OHQvYXl4TDFjRG9qS3RmUktqbWtWOTRaQWFSWGhsZWYycGhpSWlTaTVOR1Uz?=
 =?utf-8?B?QmxxNEVCNUUzM2dRNzZBVUoyWjQ4cXVEbm12dGNzUHJVMS83UGVlMHdSbEM4?=
 =?utf-8?B?WE1kMlgvZmN3ZG5JVVdMajRpMVBJTk8rdmZmTHRUbXcreEV6RlRMemFPSWlS?=
 =?utf-8?B?bmtQaTVzYW5oaWhBZjFzZVFuc3FIeFFBK3dYOEhKY3Z2SDM4UHFwd3hvQWxW?=
 =?utf-8?B?eFAwY0NRemZhdU9neElvOVhkN09FYzRrUXVCOWRlbDBYWU9tUCtwQjkvSHlx?=
 =?utf-8?B?WlRvTmlYMjBzdXZQQkdmL3BjSHROTkYvcWFIOC90dWdBS05tM1ZrWTVrV3Zn?=
 =?utf-8?B?MUlFSG0xbEFNMEpJM3oxdVBJelVoVVp5QzV6OWRNRE9rUTVTSmIxMktKY1BK?=
 =?utf-8?B?TFNJZ3lvTjBCd0lQZ2xKNUhCNWREWlczaVF1ZkxKL2ZvTE83VDVQd0hzK295?=
 =?utf-8?B?VWY3VGlXVUJneDFtLytpL1o2MlpSeFFQWVBzUTlWeU9OZlJvV2JqVjBTTHZL?=
 =?utf-8?B?eFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A3D21E3BFBFE840B24A96C5598E6E18@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17474377-90c9-4bb6-9699-08de336aae55
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 19:24:01.6875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6+ZoYg9lbJDv+cQKWhzwDCHP8ySIHH8m4ZwJY1MNH1ghgLSzUEcMqijNUL0BleWMzcatAV9/8T67bjhNuNhP2zUnuQ+oT/dW4fytTpGRWyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6277
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

T24gVGh1LCAyMDI1LTExLTIwIGF0IDE5OjU3IC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IEFkZCBpbmZyYXN0cnVjdHVyZSB0byBzdXBwb3J0IHhlX2V4ZWNfcXVldWVf
c2V0X3Byb3BlcnR5X2lvY3RsKCkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYWxsYXZpIE1pc2hyYSA8
cGFsbGF2aS5taXNocmFAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE5pcmFuamFuYSBWaXNo
d2FuYXRoYXB1cmEKPiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+Cj4gLS0t
Cj4gwqBsaWIveGUveGVfaW9jdGwuYyB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
IMKgbGliL3hlL3hlX2lvY3RsLmggfMKgIDQgKysrKwo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAzMSBp
bnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9pb2N0bC5jIGIvbGliL3hl
L3hlX2lvY3RsLmMKPiBpbmRleCAzOWM0NjY3YTEuLjMxOTg1M2RhMCAxMDA2NDQKPiAtLS0gYS9s
aWIveGUveGVfaW9jdGwuYwo+ICsrKyBiL2xpYi94ZS94ZV9pb2N0bC5jCj4gQEAgLTUwMyw2ICs1
MDMsMzMgQEAgdWludDMyX3QgeGVfZXhlY19xdWV1ZV9jcmVhdGVfY2xhc3MoaW50IGZkLAo+IHVp
bnQzMl90IHZtLCB1aW50MTZfdCBjbGFzcykKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGNyZWF0
ZS5leGVjX3F1ZXVlX2lkOwo+IMKgfQo+IMKgCj4gK2ludCBfX3hlX2V4ZWNfcXVldWVfc2V0X3By
b3BlcnR5KGludCBmZCwgdWludDMyX3QgZXhlY19xdWV1ZSwKPiB1aW50MzJfdCBwcm9wZXJ0eSwK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdWludDY0X3QgdmFsdWUpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJt
X3hlX2V4ZWNfcXVldWVfc2V0X3Byb3BlcnR5IHhlX3ByaW9yaXR5ID0gewo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAucHJvcGVydHkgPSBwcm9wZXJ0eSwKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgLmV4ZWNfcXVldWVfaWQgPSBleGVjX3F1ZXVlLAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAudmFsdWXCoCA9IHZhbHVlLAo+ICvCoMKgwqDCoMKgwqDC
oH07Cj4gK8KgwqDCoMKgwqDCoMKgaW50IGVycjsKPiArCj4gK8KgwqDCoMKgwqDCoMKgZXJyID0g
aWd0X2lvY3RsKGZkLCBEUk1fSU9DVExfWEVfRVhFQ19RVUVVRV9TRVRfUFJPUEVSVFksCj4gJnhl
X3ByaW9yaXR5KTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoZXJyKSB7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGVyciA9IC1lcnJubzsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWd0X2Fzc3VtZShlcnIpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBl
cnJubyA9IDA7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7Cj4g
K8KgwqDCoMKgwqDCoMKgfQo+ICsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiArfQo+ICsK
PiArdm9pZCB4ZV9leGVjX3F1ZXVlX3NldF9wcm9wZXJ0eShpbnQgZmQsIHVpbnQzMl90IGV4ZWNf
cXVldWUsCj4gdWludDMyX3QgcHJvcGVydHksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdWludDY0X3QgdmFsdWUpCj4gK3sK
PiArwqDCoMKgwqDCoMKgwqBpZ3RfYXNzZXJ0X2VxKF9feGVfZXhlY19xdWV1ZV9zZXRfcHJvcGVy
dHkoZmQsIGV4ZWNfcXVldWUsCj4gcHJvcGVydHksIHZhbHVlKSwgMCk7Cj4gK30KPiArCj4gwqB2
b2lkIHhlX2V4ZWNfcXVldWVfZGVzdHJveShpbnQgZmQsIHVpbnQzMl90IGV4ZWNfcXVldWUpCj4g
wqB7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1feGVfZXhlY19xdWV1ZV9kZXN0cm95IGRl
c3Ryb3kgPSB7Cj4gZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9pb2N0bC5oIGIvbGliL3hlL3hlX2lv
Y3RsLmgKPiBpbmRleCBhZThhMjNhNTQuLmE3ZmQ0M2M5ZSAxMDA2NDQKPiAtLS0gYS9saWIveGUv
eGVfaW9jdGwuaAo+ICsrKyBiL2xpYi94ZS94ZV9pb2N0bC5oCj4gQEAgLTgzLDYgKzgzLDEwIEBA
IHVpbnQzMl90IHhlX2V4ZWNfcXVldWVfY3JlYXRlKGludCBmZCwgdWludDMyX3Qgdm0sCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDY0X3Qg
ZXh0KTsKPiDCoHVpbnQzMl90IHhlX2JpbmRfZXhlY19xdWV1ZV9jcmVhdGUoaW50IGZkLCB1aW50
MzJfdCB2bSwgdWludDY0X3QKPiBleHQpOwo+IMKgdWludDMyX3QgeGVfZXhlY19xdWV1ZV9jcmVh
dGVfY2xhc3MoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDE2X3QKPiBjbGFzcyk7Cj4gK2ludCBf
X3hlX2V4ZWNfcXVldWVfc2V0X3Byb3BlcnR5KGludCBmZCwgdWludDMyX3QgZXhlY19xdWV1ZSwK
PiB1aW50MzJfdCBwcm9wZXJ0eSwKCkkgbWlnaHQgaGF2ZSBtaXNzZWQgaXQsIGJ1dCB3aHkgYXJl
IHdlIGV4cG9zaW5nIHRoaXMgb25lPyBJIGRvbid0IHNlZQp0aGF0IHdlIHVzZSB0aGUgaW50ZXJu
YWwgZnVuY3Rpb24gYW55d2hlcmUsIGp1c3QgdGhlIHdyYXBwZXIgYmVsb3cgdGhhdApoYXMgdGhl
IGFzc2VydC4KClRoYW5rcywKU3R1YXJ0Cgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50NjRfdCB2YWx1ZSk7Cj4gK3Zv
aWQgeGVfZXhlY19xdWV1ZV9zZXRfcHJvcGVydHkoaW50IGZkLCB1aW50MzJfdCBleGVjX3F1ZXVl
LAo+IHVpbnQzMl90IHByb3BlcnR5LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVpbnQ2NF90IHZhbHVlKTsKPiDCoHZvaWQg
eGVfZXhlY19xdWV1ZV9kZXN0cm95KGludCBmZCwgdWludDMyX3QgZXhlY19xdWV1ZSk7Cj4gwqB1
aW50NjRfdCB4ZV9ib19tbWFwX29mZnNldChpbnQgZmQsIHVpbnQzMl90IGJvKTsKPiDCoHZvaWQg
KnhlX2JvX21hcChpbnQgZmQsIHVpbnQzMl90IGJvLCBzaXplX3Qgc2l6ZSk7Cgo=
