Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58F8CDE00F
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 14:55:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AEA10EB73;
	Thu, 26 Sep 2024 14:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Msn4V8sa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5247C10EB73
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 14:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727362521; x=1758898521;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jr2SsXFyiTjCmsf5/XSO+QLXscVa64yvLfbuqhMZGxY=;
 b=Msn4V8sayATRLKvAAjMeFvZYoABNcoz0/9rPlCOvFAGHasVVvUFt3OPP
 Fv4do/M24Q1xRQb4YLlaLu7e7YC2ot+H9u+lAEy3q3toadlbDnHSprD1i
 cJE8ixVQ0RjkaW9rPBlTf/LJhfgR0vL+tsYUD44xRFPBw0g9/gRQPEEKa
 MnPL0sxG0OvAmyCg/4sjX97stfvkAPvaFz08VDboR10VR2teOFdnjrzlV
 Oj5uTdgsgjSQ7up++2EaFG63N5QIEmbknLJxRPm0viB/2S/OnOnH1AQzb
 Rh6ep/Bj2eaRgpJ5UuRXahPnN94s22m2n02FMnblIu58XyaFstlWTXEpX A==;
X-CSE-ConnectionGUID: cKWJzGH9T3ac3FjXsXuEDQ==
X-CSE-MsgGUID: jQRKPMYnTl+dJ2SnFg+dnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37134052"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="37134052"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 07:55:20 -0700
X-CSE-ConnectionGUID: hxWyja/gTDOL2IuMqj/azA==
X-CSE-MsgGUID: C5t+QiG5SWOleKUmElrieg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="72626887"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 07:55:20 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 07:55:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 07:55:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 07:55:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JO9oPh7gUFiivvW7F3UDuA3r+f3UbNcn4GAqUD0JPjrwSpk/EZQkl2N+lEX8PiFeWyhGp7rdst+q2dC7ozQ/gyH6OTjfPqWoYjKaYp+bSvY3qEPEaInSCc5e5ug62Ko1IxqaNkZgGFbfytvOFR3m0fRT0ucYABTAfHpXGC+zfZIbX66XNUdcg3yb/N9JJ9+IO6JxrfoXp1jnPkprci7zA2h7oCNqoq607DUxUVTdLh+ESInk3a/TLL8OUuHOLoXk+7gdeJe4CEs2yWcY7lHXJdqAoLSzDKdyyKZ0tPRuyxRdNaJjqg8Mj0q15S9EBwMsn4PLQjQq7VzCFdi+G69q9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jr2SsXFyiTjCmsf5/XSO+QLXscVa64yvLfbuqhMZGxY=;
 b=gt8Krfg07EY8iVu24en1nH0RHo2+FSvWmZPoAHvnc6/3sam6ZeWUe7FaHEunOmDkjVpqSWDgCiy6oQ0GZPT/WcxZ79S6t0N+8x9cUphsKddI8Kzn6zhHytA65pomTr0VMiLWK6tI8YFyU47uvqKeXRWkT3hOvT5WwQJ2Yim1Q/Bno7rUwz1StFD6llm7tKTVpYubPGIXwNVUXpyF4QQ3JtCUUpAH+bNTdYZbe0cRqtlnXt63+LUgelAxtok+aUS0IYV6YNr6AP0FPxH2DVTBUSaF4HT4VmDZHmftT5T1ouqEj2pr0PwRj0oW4gg4TJRusVqyljl1TFUcFWMxN7nY2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA2PR11MB5081.namprd11.prod.outlook.com (2603:10b6:806:118::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 14:55:12 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 14:55:12 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Grzegorzek,
 Dominik" <dominik.grzegorzek@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 1/2] lib/xe_eudebug: Introduce preempt_timeout
 helpers
Thread-Topic: [PATCH i-g-t 1/2] lib/xe_eudebug: Introduce preempt_timeout
 helpers
Thread-Index: AQHbEA5SEOrPN77KrUWejierbIRnYrJqHSYg
Date: Thu, 26 Sep 2024 14:55:12 +0000
Message-ID: <CH0PR11MB544464A6ACF57638DEAA63F9E56A2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240926121846.5885-1-dominik.karol.piatkowski@intel.com>
 <20240926121846.5885-2-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20240926121846.5885-2-dominik.karol.piatkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA2PR11MB5081:EE_
x-ms-office365-filtering-correlation-id: bb1cafa2-064f-46cf-0cc7-08dcde3b393e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SE5lVTFkSjZZaktCTitMNk56dURCY1gzUlNCWEt2ZGh6UUpzejdlcThJQUR0?=
 =?utf-8?B?aDJoSXl1ZDhNVUN3elErL1NEMWpQRjcxZ3k2R1ZuU3hwOHpra3FtelJLZ3pr?=
 =?utf-8?B?cG00MnFZN1A3dlU0U284QnQ1VXNrL091ejJqdmpvRWNQMU9QZlk3S2VPSzNa?=
 =?utf-8?B?U21DVVY2ODlzWkFoaTd3Mkx2OXA0UXpsbVpVcllGL3Fqd1hXaEx5WnRPdVlJ?=
 =?utf-8?B?blR2d29GSXo0YSszMGFZVi9DR1ZaVHlHNDlZK2VlQm5kazNDSDRiVUhvSkd6?=
 =?utf-8?B?QWN5b0V0TzVBQ0ZXektxc2JaakRmNXJ4a2I1RmlFWXVNeldyN0NBK2lNaGFm?=
 =?utf-8?B?WitDLysvRWM4REtMZUVzbE1UL3NVcUZISDFKc2JpUFFsWEpERzR6aStrMVVW?=
 =?utf-8?B?T1hjcVFWNHdGSFpwVkNFM1g4YVZoSE5nVzVGL1JvVW52V3BrWmI5WmlOWHdm?=
 =?utf-8?B?MW8rTytWL2ZWYmpsRVNIbU1oa3pZa3gzUUNlZllzR3pKSFcxc0QzcTBDbWg5?=
 =?utf-8?B?bnhvRzhxckptckg0N1VxdE92dG5OOE92ZGVycXFlV1lKVmU2ZnZWME9LTHlB?=
 =?utf-8?B?SFJ2cDJuWU1nZXFOKytRVUlhTStQdHE4cXFTMGJ0OUtFVWI3eXExWHR2ZUJ6?=
 =?utf-8?B?Z2t6Z3dCM0ZFdlU2OExFUmc5WmtISC9KbnFFT013aUNXZ2RwTlp4QnJuVVNz?=
 =?utf-8?B?Q2dYUEVxSVVMTENYdE1BaTU1TWhjYmlacjFYbVIwMGRBcllPSU9lMXhGODJS?=
 =?utf-8?B?K2YvQVhsL05qaUpRYnVIclc4TzhUQVJOMkpYN2VFb2gxMGdJbWtCQXorb3g1?=
 =?utf-8?B?TWVlUFI1VDhRV0dXVitHcGppRzVTcWFmbzJFcndrR1podnJtdlhuczBub3FY?=
 =?utf-8?B?Y2hVeXFTQkplV2hDSlFMNE8yeDFEL2IyUXNwQVgyV0tjSEEyeDk2L3pKUUZT?=
 =?utf-8?B?Tk8rdkU3V3ovUUtGbEdlRzBBWXFEVnFMa1lCME40K3lwVFFpWDJLbGJDRUxV?=
 =?utf-8?B?OHZhVld3cEVtcTc2TXNvUTZEaTFqb1hWanlRdktEcEFCcWZVNUdRMEtjbFpu?=
 =?utf-8?B?Ky9LLzFDWDUyaDc4ZEd2N0R1NXpYeHNRV2lQSTBSdzZ2bjV6cGJDbHVvYzVr?=
 =?utf-8?B?cG9HL29Ndm1xdTdTQXU4Ulh2Y0NLcVRhTENvRVZOK25aZE1wTzJsZTNYY25K?=
 =?utf-8?B?TGJ0SElWcE41VVZHd0F1L1N6SzFTdHlqbVNldmR4b2M3KzFKUVFjQzFJRkxG?=
 =?utf-8?B?c1psemdheG9JeUFRbi9QdzE1QnF1WFRuRmhQYm00L25kQXJyS1hyMytVQmpL?=
 =?utf-8?B?bDBzNlNqTkxCVko3NVAxQkFyZ2krRTMyUE9kUXI0YW9OSTFMTmJQRU5qTXdZ?=
 =?utf-8?B?YWFjRjYvS2tiNUlOZm90SUhHNUorVm0zTmZsWGZkeTJEb2xCL3VJdmM4Y1lB?=
 =?utf-8?B?dGtKLzd5L0FOSFpDV2k0dDZPajNFd3l1RXI5TEVwdDAwN0dGblFnTXNNam9o?=
 =?utf-8?B?ZU1OOEJzaGg4NURaTi9uSExEeUduemgrM2JVdXlWZGJiZVFDVzk3TVlVV1o4?=
 =?utf-8?B?MnlMbEp1dWhRaGx2ZFhqenBMK215Vnpac25sbUdSYlZKRWVtOGZyRkR1d3Q2?=
 =?utf-8?B?SnMzWlZSeXB4UURRZUg0Z3hkcHlONC95dHRKMWF5Y1ZXRDhzNGllbjJvaUZS?=
 =?utf-8?B?dG5ucm9Hd05ad0V5RjV5dWxUalFwbGgxS0JMNGdFNWE4WFNOSGRNZzFJQlBo?=
 =?utf-8?Q?OmSWwW3mLEcIdnNaWDwW9OXqlWS0ke9xe5kkUwt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVZaTEZlUEQvcE5tOExHYlN0MWl3Tk5PKzlOQUlhbnZGUTRPRDEwVUJpVWxm?=
 =?utf-8?B?cXd2WWk1WGxOSytXajZCN2pqcjQ4d3RNRDVWZWV5L2ErV2NZdS9oSkNqRlps?=
 =?utf-8?B?ZzYwMmUwaXp1S2pxeVJVUVk2b0UvKzdXYmhTMGpkdUk3c0o5UGFXb05ZZzJO?=
 =?utf-8?B?d092M3ljVTJlNkl2VXhhL1dlTEprREFsVTg5U3FvMlZ6SHJyaVhBdFZiNWkr?=
 =?utf-8?B?NVRFZXM3V25vN0dwQk0rVkJIc2tHK3N4V2Q3VC92WGhDc1dFZFE3KzlRYm9O?=
 =?utf-8?B?UVRxSTBjYllobWllc3VucTJJNTNSeTR0a3FzdE5IUWVLNzFia1NFbmNoY0kw?=
 =?utf-8?B?M25jNzI4WXpyaXhNUUJpbnFkOEJIeGZWRU9lbDB6cHlTQzFVYXdtUlJVMnRX?=
 =?utf-8?B?M0pQdmJkVENNb0pPMGx4dkxJT010cDY3SlJCQ0gzaC9nd2cxbFI5bjRvNnll?=
 =?utf-8?B?dS8xNUFQeHErQWQwMy9wS203bkFDMCtJZitIejVNMHVmRkFyVDR5WVZtdTF0?=
 =?utf-8?B?eHo1WTVMbnIrazVzN3U0bVFndFE0b09tKzB0Z1lkemgvN21lcVdndFJ3VkhU?=
 =?utf-8?B?M21MK2ExdmRsMjFLaG1UM3paRnZRUWN2ampkemNyM2dQVFNISTdyMkRrdUIr?=
 =?utf-8?B?U1dtRU44WHlJQ0RQNnpsdC9BQU84SCtwakNWTjBkajd4T3FheGFUSVdJSDVK?=
 =?utf-8?B?NlhUei9qVEMyakhidVRwU1htaXE0aXNQQ21jbTB0cXBxSjlTSkJSSUFZb01Y?=
 =?utf-8?B?b21CNFp3VnJWNXpsV1loNk95aGVCRlJ6bityQzhuUzBIOTF3cnNlRFlMNkJk?=
 =?utf-8?B?ZHliNjJyTzMvL3M3aTEwVnl1NXAvRXI3eERVMDNDWXFjOVREVlh1akpLaEpX?=
 =?utf-8?B?MUVkamdYK00rdlRnditaTVM2cGZDVllwRWt0bGlrZ1lDZ2pGSkV2enRxYXZI?=
 =?utf-8?B?Vi80MHN4TjByL3J3NERhTTBoSFU5V24xYlJWWWNXK3BCWXdwNUwrTTNqemJB?=
 =?utf-8?B?WmtoQ0dYSk5Pb2JJMExVSWhPZy8rRGtBK1l4Z0NIVURxME94aG9EUnFDMVc5?=
 =?utf-8?B?akltVm5HUStEVFBrOEI3dW5RMkZxaGZtWkdSaUtQRVVJRVp2VXh0aUl3aUo3?=
 =?utf-8?B?WGQ5Q0hMekNuKzI3MkNXd0xvOWZ2SnlTMGExTzltNTZNa25ZZ1FCUnNMYk93?=
 =?utf-8?B?R1Y3UmxyV01ySTdlTnRpQTJFWkgzamx4azNxNTBjclUxa1BsbXdDd1BCMFNy?=
 =?utf-8?B?MTlGNGY0ZjhuSXJmalJqZXoyZ29JVXJmdFczY2VoMHlHWno5K2RJcERKYjly?=
 =?utf-8?B?NFpYR3JQRUNza0dKL0hYdUQ3ZXFNSlhSVy8xaDg4aGVDRm5Oa1hwSjh0a0FT?=
 =?utf-8?B?Z0s5bjM1NDRFYzdKUzlEbmUzdmU0WHVlZE1GZnhEZlFFclphN0RJT1crQUhp?=
 =?utf-8?B?N1VZa3lRU2swa0pTU2xQMlJ0Rk9NZ3JiTDJWdUNGM3ZyT09jRzEydzZZejY5?=
 =?utf-8?B?ZU9pak1uTGtXaExWand0Y05SK0xiKzQ5UzBBdlZjSnlqZFBBVEROM0VSaFFL?=
 =?utf-8?B?Ri9aQ1Y0N29yNzVjNU41bTE1dVluWjBSeE1uV1oxb0dqMllreU5yamZnZnc5?=
 =?utf-8?B?SEN5OTN2QnlWekRUTlJiUFB4aEY2SDFHRk5NSG13d0dhWEZqRHUwdXJzYWhX?=
 =?utf-8?B?Kzk3R1JTQkcvNXk5MlY3cWlXUWlTMzFLSnJ6UnE5MkU5d1RNMTVjUTVOaDZN?=
 =?utf-8?B?MENWN0wxbVZ2RjdaWklMTlJkV2FhanQzU1pUcEwxaVdEOWxuK0E1d2Fhdnhs?=
 =?utf-8?B?RlFTU1BxVWpHdkR6c0t3bDFDRVE5dlpwOThQNlNCYnBRMGh2ZUszQ3hLa1ho?=
 =?utf-8?B?a1ZZU0dKVlNZOHUrUGRudnMveXpmdlBvM0VZT1ppWnI1K1ZKdmdPbXBacXdJ?=
 =?utf-8?B?ZHJLR21IY21xUWNGVFFyVktKcVNVWE4xZnN6UjdWYi9Zb0NNdEw4eHVpa3Bw?=
 =?utf-8?B?K1ZOK2NhejFZVGlLeHFGNi80dWRxb0dyeUl2eHJNNVdQQ2JmZlVNL0hzZFJG?=
 =?utf-8?B?ZGlvQloycTMrb2JYVTRONHdwVEd2SERleExQaW5OSEVHdGt5T0lnSFcrWXFL?=
 =?utf-8?Q?EECRb/makonI2InOyBr6D9jc5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1cafa2-064f-46cf-0cc7-08dcde3b393e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 14:55:12.4463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fdTTb2JUnNS9x6uU3vjk2v5iYKTjyF2jLbLIm18C47XMa0S1tVSxQQ4728rbCwwcVu+vmQbxjJCojeLPL8Pu/QO/ucz8ywoNUMdF3hd45BE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5081
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGlndC1kZXYgPGlndC1kZXYtYm91bmNl
c0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBEb21pbmlrIEthcm9sIFBpYXRr
b3dza2kNClNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMjYsIDIwMjQgNToxOSBBTQ0KVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogS2VtcGN6eW5za2ksIFpiaWduaWV3IDx6
Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+OyBHcnplZ29yemVrLCBEb21pbmlrIDxkb21p
bmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPjsgTWFuc3pld3NraSwgQ2hyaXN0b3BoIDxjaHJpc3Rv
cGgubWFuc3pld3NraUBpbnRlbC5jb20+OyBTaWtvcmEsIFBhd2VsIDxwYXdlbC5zaWtvcmFAaW50
ZWwuY29tPjsgUGlhdGtvd3NraSwgRG9taW5payBLYXJvbCA8ZG9taW5pay5rYXJvbC5waWF0a293
c2tpQGludGVsLmNvbT4NClN1YmplY3Q6IFtQQVRDSCBpLWctdCAxLzJdIGxpYi94ZV9ldWRlYnVn
OiBJbnRyb2R1Y2UgcHJlZW1wdF90aW1lb3V0IGhlbHBlcnMNCj4gDQo+IFRoaXMgcGF0Y2ggaW50
cm9kdWNlcyBwcmVlbXB0X3RpbWVvdXQgaGVscGVyczoNCg0KTml0Og0KSUlSQyB3ZSBwcm9iYWJs
eSBzaG91bGRuJ3QgcmVmZXIgdG8gdGhlIHBhdGNoZXMvY29tbWl0cyBkaXJlY3RseSBpbiB0aGUg
Y29tbWl0IG1lc3NhZ2UuICBNYXliZSBzb21ldGhpbmcgbGlrZSB0aGlzIGluc3RlYWQ6DQoNCiIi
Ig0KSW50cm9kdWNlIHRoZSBmb2xsb3dpbmcgcHJlZW1wdF90aW1lb3V0IGhlbHBlcnM6DQoiIiIN
Cg0KPiAgLSB4ZV9ldWRlYnVnX3NldF9wcmVlbXB0X3RpbWVvdXRfdG9fbWF4DQo+ICAgIFNldHMg
cHJlZW1wdF90aW1lb3V0X3VzIGZvciBnaXZlbiBlbmdpbmVfY2xhc3MgdG8gbWF4aW11bS4NCj4g
IC0geGVfZXVkZWJ1Z19yZXN0b3JlX3ByZWVtcHRfdGltZW91dA0KPiAgICBTZXRzIHByZWVtcHRf
dGltZW91dF91cyBmb3IgZ2l2ZW4gZW5naW5lX2NsYXNzIHRvIHByZXZpb3VzIHZhbHVlLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogRG9taW5payBLYXJvbCBQacSFdGtvd3NraSA8ZG9taW5pay5rYXJv
bC5waWF0a293c2tpQGludGVsLmNvbT4NCg0KU29tZSBtaW5vciBuaXRzIGFuZCBub24tYmxvY2tp
bmcgc3VnZ2VzdGlvbnMsIGJ1dCBvdGhlcndpc2U6DQpSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2F2
aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgbGliL3hlL3hlX2V1
ZGVidWcuYyB8IDEyMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiAgbGliL3hlL3hlX2V1ZGVidWcuaCB8ICAgMyArKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
MjMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9ldWRlYnVnLmMg
Yi9saWIveGUveGVfZXVkZWJ1Zy5jDQo+IGluZGV4IDJjN2NkMmFlMS4uMjI5ZjllNmExIDEwMDY0
NA0KPiAtLS0gYS9saWIveGUveGVfZXVkZWJ1Zy5jDQo+ICsrKyBiL2xpYi94ZS94ZV9ldWRlYnVn
LmMNCj4gQEAgLTE2LDYgKzE2LDcgQEANCj4gICNpbmNsdWRlICJpbnRlbF9wYXQuaCINCj4gICNp
bmNsdWRlICJ4ZV9ldWRlYnVnLmgiDQo+ICAjaW5jbHVkZSAieGVfaW9jdGwuaCINCj4gKyNpbmNs
dWRlICJ4ZV9kcm0uaCINCj4gIA0KPiAgc3RydWN0IGV2ZW50X3RyaWdnZXIgew0KPiAgCXhlX2V1
ZGVidWdfdHJpZ2dlcl9mbiBmbjsNCj4gQEAgLTE3MTcsNiArMTcxOCwxMjUgQEAgYm9vbCB4ZV9l
dWRlYnVnX2VuYWJsZShpbnQgZmQsIGJvb2wgZW5hYmxlKQ0KPiAgCXJldHVybiBvbGQ7DQo+ICB9
DQo+ICANCj4gKy8qKg0KPiArICogeGVfZXVkZWJ1Z19zZXRfcHJlZW1wdF90aW1lb3V0X3RvX21h
eA0KPiArICogQGZkOiB4ZSBjbGllbnQNCj4gKyAqIEBlbmdpbmVfY2xhc3M6IGVuZ2luZSBjbGFz
cyB0byBtb2RpZnkgKGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UtPmVuZ2luZV9jbGFzcykN
Cj4gKyAqIEB2YWx1ZTogcG9pbnRlciB0byB2YXJpYWJsZSB0byBzdG9yZSBwcmV2aW91cyBwcmVl
bXB0X3RpbWVvdXQgdmFsdWUgaW4sIG5lZWRlZCBmb3IgcmVzdG9yZQ0KPiArICoNCj4gKyAqIFNl
dHMgcHJlZW1wdF90aW1lb3V0X3VzIGZvciBnaXZlbiBlbmdpbmVfY2xhc3MgdG8gbWF4aW11bS4N
Cj4gKyAqDQo+ICsgKiBSZXR1cm5zOiB0cnVlIG9uIHN1Y2Nlc3MsIGZhbHNlIG9uIGZhaWx1cmUu
DQo+ICsgKi8NCj4gK2Jvb2wgeGVfZXVkZWJ1Z19zZXRfcHJlZW1wdF90aW1lb3V0X3RvX21heChp
bnQgZmQsIHVpbnQxNl90IGVuZ2luZV9jbGFzcywgdWludDMyX3QgKnZhbHVlKQ0KPiArew0KPiAr
CWludCBlbmdpbmVzX2ZkOw0KPiArCWludCBndF9mZDsNCj4gKwl1aW50MzJfdCBtYXhfdmFsdWU7
DQo+ICsNCj4gKwlpZ3RfYXNzZXJ0KGVuZ2luZV9jbGFzcyA9PSBEUk1fWEVfRU5HSU5FX0NMQVNT
X1JFTkRFUiB8fA0KPiArCQkgICBlbmdpbmVfY2xhc3MgPT0gRFJNX1hFX0VOR0lORV9DTEFTU19D
T01QVVRFKTsNCj4gKw0KPiArCWd0X2ZkID0geGVfc3lzZnNfZ3Rfb3BlbihmZCwgMCk7DQo+ICsJ
aWYgKGd0X2ZkID09IC0xKSB7DQo+ICsJCWlndF9kZWJ1ZygiRmFpbGVkIHRvIG9wZW4gZ3QuXG4i
KTsNCj4gKw0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKGVuZ2luZV9j
bGFzcyA9PSBEUk1fWEVfRU5HSU5FX0NMQVNTX1JFTkRFUikNCj4gKwkJZW5naW5lc19mZCA9IG9w
ZW5hdChndF9mZCwgImVuZ2luZXMvcmNzIiwgT19SRE9OTFkpOw0KPiArCWVsc2UNCj4gKwkJZW5n
aW5lc19mZCA9IG9wZW5hdChndF9mZCwgImVuZ2luZXMvY2NzIiwgT19SRE9OTFkpOw0KPiArDQo+
ICsJaWYgKGVuZ2luZXNfZmQgPT0gLTEpIHsNCj4gKwkJaWd0X2RlYnVnKCJGYWlsZWQgdG8gb3Bl
biBlbmdpbmUgY2xhc3MuXG4iKTsNCj4gKwkJY2xvc2UoZ3RfZmQpOw0KPiArDQo+ICsJCXJldHVy
biBmYWxzZTsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoIV9faWd0X3N5c2ZzX2dldF91MzIoZW5naW5l
c19mZCwgInByZWVtcHRfdGltZW91dF91cyIsIHZhbHVlKSkgew0KPiArCQlpZ3RfZGVidWcoIkZh
aWxlZCB0byByZWFkIHByZWVtcHRfdGltZW91dF91cy5cbiIpOw0KPiArCQljbG9zZShlbmdpbmVz
X2ZkKTsNCj4gKwkJY2xvc2UoZ3RfZmQpOw0KPiArDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKwl9
DQo+ICsNCj4gKwlpZiAoIV9faWd0X3N5c2ZzX2dldF91MzIoZW5naW5lc19mZCwgInByZWVtcHRf
dGltZW91dF9tYXgiLCAmbWF4X3ZhbHVlKSkgew0KPiArCQlpZ3RfZGVidWcoIkZhaWxlZCB0byBy
ZWFkIHByZWVtcHRfdGltZW91dF9tYXguXG4iKTsNCj4gKwkJY2xvc2UoZW5naW5lc19mZCk7DQo+
ICsJCWNsb3NlKGd0X2ZkKTsNCj4gKw0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsJfQ0KPiArDQo+
ICsJaWYgKCFfX2lndF9zeXNmc19zZXRfdTMyKGVuZ2luZXNfZmQsICJwcmVlbXB0X3RpbWVvdXRf
dXMiLCBtYXhfdmFsdWUpKSB7DQo+ICsJCWlndF9kZWJ1ZygiRmFpbGVkIHRvIHdyaXRlIHByZWVt
cHRfdGltZW91dF91cy5cbiIpOw0KPiArCQljbG9zZShlbmdpbmVzX2ZkKTsNCj4gKwkJY2xvc2Uo
Z3RfZmQpOw0KPiArDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKwl9DQo+ICsNCj4gKwljbG9zZShl
bmdpbmVzX2ZkKTsNCj4gKwljbG9zZShndF9mZCk7DQo+ICsNCj4gKwlyZXR1cm4gdHJ1ZTsNCg0K
Tm9uLWJsb2NraW5nOg0KV2UgbWlnaHQgYmUgYWJsZSB0byBjb2xsYXBzZSBzb21lIG9mIHRoZXNl
IGZvciBicmFuY2hlcyB1c2luZyBnb3RvIHN0YXRlbWVudHM6DQoNCiIiIg0KCWludCBlbmdpbmVz
X2ZkOw0KCWludCBndF9mZDsNCgl1aW50MzJfdCBtYXhfdmFsdWU7DQoJYm9vbCByZXQgPSBmYWxz
ZTsNCi4uLg0KCWlmIChlbmdpbmVzX2ZkID09IC0xKSB7DQoJCWlndF9kZWJ1ZygiRmFpbGVkIHRv
IG9wZW4gZW5naW5lIGNsYXNzLlxuIik7DQoJCWdvdG8gZW5naW5lX2VycjsNCgl9DQoNCglpZiAo
IV9faWd0X3N5c2ZzX2dldF91MzIoZW5naW5lc19mZCwgInByZWVtcHRfdGltZW91dF91cyIsIHZh
bHVlKSkgew0KCQlpZ3RfZGVidWcoIkZhaWxlZCB0byByZWFkIHByZWVtcHRfdGltZW91dF91cy5c
biIpOw0KCQlnb3RvIHN5c2ZzX2VycjsNCgl9DQoNCglpZiAoIV9faWd0X3N5c2ZzX2dldF91MzIo
ZW5naW5lc19mZCwgInByZWVtcHRfdGltZW91dF9tYXgiLCAmbWF4X3ZhbHVlKSkgew0KCQlpZ3Rf
ZGVidWcoIkZhaWxlZCB0byByZWFkIHByZWVtcHRfdGltZW91dF9tYXguXG4iKTsNCgkJZ290byBz
eXNmc19lcnI7DQoJfQ0KDQoJaWYgKCFfX2lndF9zeXNmc19zZXRfdTMyKGVuZ2luZXNfZmQsICJw
cmVlbXB0X3RpbWVvdXRfdXMiLCBtYXhfdmFsdWUpKSB7DQoJCWlndF9kZWJ1ZygiRmFpbGVkIHRv
IHdyaXRlIHByZWVtcHRfdGltZW91dF91cy5cbiIpOw0KCQlnb3RvIHN5c2ZzX2VycjsNCgl9DQoN
CglyZXQgPSB0cnVlOw0KDQpzeXNmc19lcnI6DQoJY2xvc2UoZW5naW5lc19mZCk7DQplbmdpbmVf
ZXJyOg0KCWNsb3NlKGd0X2ZkKTsNCglyZXR1cm4gcmV0Ow0KIiIiDQoNClRoaXMgaXNuJ3Qgc3Ry
aWN0bHkgbmVjZXNzYXJ5LCBqdXN0IHNvbWV0aGluZyB0byBjb25zaWRlci4NCg0KPiArfQ0KPiAr
DQo+ICsvKioNCj4gKyAqIHhlX2V1ZGVidWdfcmVzdG9yZV9wcmVlbXB0X3RpbWVvdXQNCj4gKyAq
IEBmZDogeGUgY2xpZW50DQo+ICsgKiBAZW5naW5lX2NsYXNzOiBlbmdpbmUgY2xhc3MgdG8gbW9k
aWZ5IChkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlLT5lbmdpbmVfY2xhc3MpDQo+ICsgKiBA
dmFsdWU6IHByZXZpb3VzIHByZWVtcHRfdGltZW91dCB2YWx1ZQ0KPiArICoNCj4gKyAqIFNldHMg
cHJlZW1wdF90aW1lb3V0X3VzIGZvciBnaXZlbiBlbmdpbmVfY2xhc3MgdG8gcHJldmlvdXMgdmFs
dWUuDQo+ICsgKg0KPiArICogUmV0dXJuczogdHJ1ZSBvbiBzdWNjZXNzLCBmYWxzZSBvbiBmYWls
dXJlLg0KPiArICovDQo+ICtib29sIHhlX2V1ZGVidWdfcmVzdG9yZV9wcmVlbXB0X3RpbWVvdXQo
aW50IGZkLCB1aW50MTZfdCBlbmdpbmVfY2xhc3MsIHVpbnQzMl90IHZhbHVlKQ0KPiArew0KPiAr
CWludCBlbmdpbmVzX2ZkOw0KPiArCWludCBndF9mZDsNCj4gKw0KPiArCWlndF9hc3NlcnQoZW5n
aW5lX2NsYXNzID09IERSTV9YRV9FTkdJTkVfQ0xBU1NfUkVOREVSIHx8DQo+ICsJCSAgIGVuZ2lu
ZV9jbGFzcyA9PSBEUk1fWEVfRU5HSU5FX0NMQVNTX0NPTVBVVEUpOw0KPiArDQo+ICsJZ3RfZmQg
PSB4ZV9zeXNmc19ndF9vcGVuKGZkLCAwKTsNCj4gKwlpZiAoZ3RfZmQgPT0gLTEpIHsNCj4gKwkJ
aWd0X2RlYnVnKCJGYWlsZWQgdG8gb3BlbiBndC5cbiIpOw0KPiArDQo+ICsJCXJldHVybiBmYWxz
ZTsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoZW5naW5lX2NsYXNzID09IERSTV9YRV9FTkdJTkVfQ0xB
U1NfUkVOREVSKQ0KPiArCQllbmdpbmVzX2ZkID0gb3BlbmF0KGd0X2ZkLCAiZW5naW5lcy9yY3Mi
LCBPX1JET05MWSk7DQo+ICsJZWxzZQ0KPiArCQllbmdpbmVzX2ZkID0gb3BlbmF0KGd0X2ZkLCAi
ZW5naW5lcy9jY3MiLCBPX1JET05MWSk7DQo+ICsNCj4gKwlpZiAoZW5naW5lc19mZCA9PSAtMSkg
ew0KPiArCQlpZ3RfZGVidWcoIkZhaWxlZCB0byBvcGVuIGVuZ2luZSBjbGFzcy5cbiIpOw0KPiAr
CQljbG9zZShndF9mZCk7DQo+ICsNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArCX0NCj4gKw0KPiAr
CWlmICghX19pZ3Rfc3lzZnNfc2V0X3UzMihlbmdpbmVzX2ZkLCAicHJlZW1wdF90aW1lb3V0X3Vz
IiwgdmFsdWUpKSB7DQo+ICsJCWlndF9kZWJ1ZygiRmFpbGVkIHRvIHdyaXRlIHByZWVtcHRfdGlt
ZW91dF91cy5cbiIpOw0KPiArCQljbG9zZShlbmdpbmVzX2ZkKTsNCj4gKwkJY2xvc2UoZ3RfZmQp
Ow0KPiArDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKwl9DQo+ICsNCj4gKwljbG9zZShlbmdpbmVz
X2ZkKTsNCj4gKwljbG9zZShndF9mZCk7DQo+ICsNCj4gKwlyZXR1cm4gdHJ1ZTsNCg0KTm9uLWJs
b2NraW5nOg0KU2ltaWxhciB0byBhYm92ZSwgYnV0IHRoZXJlJ3MgbGVzcyB0byBjb2xsYXBzZSwg
c28gaXQncyBldmVuIGxlc3MgbmVjZXNzYXJ5Lg0KLUpvbmF0aGFuIENhdml0dA0KDQo+ICt9DQo+
ICsNCj4gIC8qIEV1IGRlYnVnZ2VyIHdyYXBwZXJzIGFyb3VuZCByZXNvdXJjZSBjcmVhdGluZyB4
ZSBpb2N0bHMuICovDQo+ICANCj4gIC8qKg0KPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX2V1ZGVi
dWcuaCBiL2xpYi94ZS94ZV9ldWRlYnVnLmgNCj4gaW5kZXggMjlhYjY4ZmVlLi4xNDQwMzU4NjIg
MTAwNjQ0DQo+IC0tLSBhL2xpYi94ZS94ZV9ldWRlYnVnLmgNCj4gKysrIGIvbGliL3hlL3hlX2V1
ZGVidWcuaA0KPiBAQCAtMTY3LDYgKzE2Nyw5IEBAIHZvaWQgeGVfZXVkZWJ1Z19jbGllbnRfc2V0
X2RhdGEoc3RydWN0IHhlX2V1ZGVidWdfY2xpZW50ICpjLCB2b2lkICpwdHIpOw0KPiAgDQo+ICBi
b29sIHhlX2V1ZGVidWdfZW5hYmxlKGludCBmZCwgYm9vbCBlbmFibGUpOw0KPiAgDQo+ICtib29s
IHhlX2V1ZGVidWdfc2V0X3ByZWVtcHRfdGltZW91dF90b19tYXgoaW50IGZkLCB1aW50MTZfdCBl
bmdpbmVfY2xhc3MsIHVpbnQzMl90ICp2YWx1ZSk7DQo+ICtib29sIHhlX2V1ZGVidWdfcmVzdG9y
ZV9wcmVlbXB0X3RpbWVvdXQoaW50IGZkLCB1aW50MTZfdCBlbmdpbmVfY2xhc3MsIHVpbnQzMl90
IHZhbHVlKTsNCj4gKw0KPiAgaW50IHhlX2V1ZGVidWdfY2xpZW50X29wZW5fZHJpdmVyKHN0cnVj
dCB4ZV9ldWRlYnVnX2NsaWVudCAqYyk7DQo+ICB2b2lkIHhlX2V1ZGVidWdfY2xpZW50X2Nsb3Nl
X2RyaXZlcihzdHJ1Y3QgeGVfZXVkZWJ1Z19jbGllbnQgKmMsIGludCBmZCk7DQo+ICB1aW50MzJf
dCB4ZV9ldWRlYnVnX2NsaWVudF92bV9jcmVhdGUoc3RydWN0IHhlX2V1ZGVidWdfY2xpZW50ICpj
LCBpbnQgZmQsDQo+IC0tIA0KPiAyLjM0LjENCj4gDQo+IA0K
