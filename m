Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCDDF55452
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 04:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFA610E68F;
	Wed, 25 Feb 2026 04:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dg0JGOWT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3E510E68F
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 04:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771994875; x=1803530875;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3BdOy3ykDXwzBEUqaxMGdO7nI8Y0rSiAHGqVQV7kC70=;
 b=Dg0JGOWTGuQDOebcI/WzjELDEe1Fc2/lP4j7w3uEJ56U/OVnmNzTfgs/
 CfyyCYkhk4TXj1GOsxp8x2FGwUIh73sf/QdgbUBraLRzLEbta9OivzgRu
 0o19x9LLEU+/ATxHaB01kg5DivKtq/ODh3ogSEwZKbfHj8FMG6Vq5RkMi
 PIYuJcBgcam/eeqMds6IBVZL9Eyzt4tF3P3EYgOA5c1N3wcUFnItMaULP
 MPuZ53Z5WtwmD/PYkkrdQNEtiXU3wGG9vmhaUaTteJnG60k6umKQvmqVa
 SXn6F9BEUPdysFjfp9eaWvNFCic/E/PbxFdCskPXrJt9jQ5QlKb4KEu9N w==;
X-CSE-ConnectionGUID: O+3kvqXjQ42/rpDpnnpzYQ==
X-CSE-MsgGUID: WEboSGGaR4u8fG4cFw2MCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72901051"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="72901051"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 20:47:55 -0800
X-CSE-ConnectionGUID: xYAhxGRcSau4wHCQ2hvhCQ==
X-CSE-MsgGUID: GGgRWy/tQ/uE84aSdRft3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="220233205"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 20:47:54 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 20:47:54 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 20:47:54 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 20:47:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaRceh1t6ROrQjWfJcPMVB15Xc/tv59FwBOW3Trd+XXY8L1cINQdiViCEyn3lzfM8iZYfhsI34WX+BvdqH9oHOBpuiGqPNmDU1VWhkOIZbDTJxzUxhv22ZWEyCCTaZTMXwf75+tgmqcJCEok2cGA+YLHeoRtd2NORqbFY2i8AWjMoB5dKZRvhZq5S4c+bvgn9et3oEaq7uDOL7eV2OzuWRWPFzmMzZYw82fAmNi+3IpLTTX+H29bWLk6YOz7xH64mglVxHxkHN+2vkxv+QZweuZETgMPIsME0zFGKArQx3FAPotV3owTTE+CyquVgkjB52Wtp26VZCoLGU2+X08QYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3BdOy3ykDXwzBEUqaxMGdO7nI8Y0rSiAHGqVQV7kC70=;
 b=nu5MSddMBipYsok6JhyXc2NAByGJ69YZKERMhqZqatoSzFX74s4TLpIhwtMeyhxHccW3U11p+GtwzKc7qHmaHnxSNv2Ccumjs1YcDQ5DrQ9Br0zQtRG6SCrOUD6R2onpeTzjUh+XM5E5IOBimRo0ZIPRdAUaybk8IcoaqGQE2ShjRvSiktHwH6h6rvJ/CVOpzUpNnr5GxU71NN/DZrlaXL3cdp1i3ipvCpkirnaSWqiScgImmuG/UcqcPKNZjzvVm+ybFUzo9uel1QV2PP5mX46rW5AGnY8opAmApXLNvSr2b1Lup3AZba0jiXnIc8rHuLT/RzSQz1TtmYjsel5aHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SN7PR11MB7467.namprd11.prod.outlook.com (2603:10b6:806:34f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 04:47:51 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 04:47:51 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_vrr: Avoid LOBF debugfs loss by
 checking during active display
Thread-Topic: [PATCH i-g-t v1] tests/kms_vrr: Avoid LOBF debugfs loss by
 checking during active display
Thread-Index: AQHcpNnRuxd9JdISbEmr1MerkmcmTLWS2dAA
Date: Wed, 25 Feb 2026 04:47:50 +0000
Message-ID: <DM4PR11MB6312F81DF868C41C34969FB79075A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260223153423.2728601-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260223153423.2728601-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SN7PR11MB7467:EE_
x-ms-office365-filtering-correlation-id: e588ff69-1d06-499b-5e66-08de74290816
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?NXlpbEQ0dTdnWWZBSk1zWXFOYTh0SFZRREhVc3IzS0dpVktnMkh5bXJuTHFN?=
 =?utf-8?B?ZGR6b2syV2lhZ21vaVVJV1pxV3hVd1ViNXNGMzZUVEdVT28wWW5TMlJaS05p?=
 =?utf-8?B?WXpaai9vNmdHZGZEL1hCMEZOQXV1ZStLN2JVdlVWMDgySnF5RjdUbE1nWnFN?=
 =?utf-8?B?YmY3clgxb3lDdEJUWnlaeGVQRnFqT3JOWWttM3orQ1pWRXNQUVlEaU9LMVhJ?=
 =?utf-8?B?VkN1eThnNUI2YXhuWStLcXljVzhUcVVlRjFiRExuaG9xQndQTzAyaWJGajY2?=
 =?utf-8?B?WnhOSDdSSVZHTjZQazgxTXlMNHVlS2xGVkNodXNIS3FCL2RHSk9BNkRMTnEr?=
 =?utf-8?B?Ti9YYWxZOWRDZy9vMTNhN1JoQ1VOUFlxeWJPaGZXdHJJVjhkNmk4YnhBalhU?=
 =?utf-8?B?dXA5Y2xKOTN4RUdjSWplNGtrcFdMZG04MytObSt6czBXYnUva1kwLytBVFVn?=
 =?utf-8?B?R1ZmQXVqS0xRTHAyZS9iTnh0bFhnMk9jRUMxWG90NDFCeW1vMjZYUnNwNG42?=
 =?utf-8?B?bEhJaThuY29jV0l2bWNCb1EwUXlsNzNBSnlEai9KdFMrSEpsdnVMc1pZb08w?=
 =?utf-8?B?NG9uUVVXNzM5NmNhN0JvZVpyWC8yY2NXMCtwLzU4TUo5ck1JS2xNNUV3cWF0?=
 =?utf-8?B?Z1g5RWRnNHZJSjd3VnhiZ3QzVnlTRDJGNTFXa1puWGZpQkxFQjU3MDVJWnUv?=
 =?utf-8?B?SUh5Zkx5a0M5V0h6TFNtOXczYWlFYXFDcG1hMjliUkp4dVlRWkRhSUpCZXZ3?=
 =?utf-8?B?dTJwdXppQ0Zlc0syVVU4aEZqazhDemNiYk0yNEoveEZwQzloVFl6cnRLR3Vs?=
 =?utf-8?B?QysxeG45T0l2VkR5T0N1UWVtSm14bUg4bEhhd25OOVBqOHRRSThvaHJlSGU0?=
 =?utf-8?B?ZElRMUxXWTV2dWozV05rZURnenhzYTRJeTJCekpCTTdBTEYrc3gwTE1sV3dQ?=
 =?utf-8?B?WmROaDVwT3hBN3U0bjRRa0diaXY5VHN2OEo2aWdkcFFKV3FkdW9TQjNRMlJk?=
 =?utf-8?B?YklZMUZLdGFHSTVMYStFT0hWU3RjR0svd3lGUVEvTlF6Z3pmV2RZSlFJVTZL?=
 =?utf-8?B?akpnQ3RXMUxaSy9qLytFa3BMTnFQWXljUHVDK0ZuSXg0SnNxQlpkd1kzMmxQ?=
 =?utf-8?B?TStBamI0MG1MRjRtU0RjZHlUTTUreUxpSnM3VVgyUUhEdzhvdzlBMzNpQ0I5?=
 =?utf-8?B?RTQ4cE05TFRSZmlIOW0zZ3BHVUpqdkJKTytmTW85Wk80d2tNMkdCUCtUNGZT?=
 =?utf-8?B?TElPUlJUOXFoOS83MWVDWmkyYlZTTHdkU0QxNGo4QlBYeE9sZFBJY1lHcWln?=
 =?utf-8?B?bW5HM1J5VC9FaVdEbm52SFVrSVBwcmdVKzI3N3pMbHFNQXdYdDU1SCtUbzlC?=
 =?utf-8?B?SHVmSUFWeDBWeForUzV1NlF1ZEZMSHppS2svVU5xd1hEWDdsRkRhQ2IwbHBq?=
 =?utf-8?B?aTNxS0h6NFY5aWd3S0RJR09FOVNHOXZpam1lN0laanUxT24rT204S2wweXpW?=
 =?utf-8?B?QkNGZzAzSS8yRCs3WjF5Sll6ZmhreUkzWmI3bzFYTmxFRUs4REpXVTJLY2t1?=
 =?utf-8?B?MCtzTXAxQ0hpSlZSNXFHcXdJUitzQ3lQd3lFKy95OW01cXdKM1l0amlVV3BC?=
 =?utf-8?B?cXhyT1VUOVpxV1pWRTBlVnU4bFlZc0s2VDF5YVFMeHJSUXNTNkE3aDJURHZF?=
 =?utf-8?B?T3lwT2lRc1RmR3YrRTkwTi94MEdzZGhMRlBkck1hOUFQSkhWMGpDSFZybUxC?=
 =?utf-8?B?YmVqL3FtV2g1VlpXcDJKOUJIUEd3eHBDV1BablhXZFhWWG04b1VpTngzb1Jy?=
 =?utf-8?B?eU9KL3dTcy8rajV2cUw4QTkrQmN0V3lqT3lkRTNzc084c1RmaWtwRjZDQmFz?=
 =?utf-8?B?b001V29aSEhmZHhuR2cybGV6N29jV09OWUlic0drdmhVWno0bllNd08ya0hN?=
 =?utf-8?B?MS9Nb2M3OVc2cDlXMGdkM25PSWpDWUtaNDVwY2hQRnYveUh6ZUgvaEJFVTRm?=
 =?utf-8?B?aE80bldJWjRuV092dG5FN3h2RVcvREZjNXVrV00wRTY4M0ZLc3Z6RW4wQ3U0?=
 =?utf-8?B?WmtTbm9jTk5WNGhyeThZN29lV1V4TmsySFo2S2UyTmszQXNZdEJmZ3NQL2Vx?=
 =?utf-8?B?b29vZTBXZHlsSlZmenptZzErUXh1S3BMZHlSNlR3aVVReW8zUGM4THFFYXpa?=
 =?utf-8?Q?a8+WUWPIY663APrfTl3Hqmg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDV6eTdqYld5TWM1and3WDNqcmFzcFJIRXd5SEhGZTZxTjY4UjVqR1d6MWVn?=
 =?utf-8?B?NmtYSCtpamNnTkFrQU9GOFQrZXh0eVA3bXhVYStldXU1ZjdEZ3phUVJrTWN3?=
 =?utf-8?B?bVExNllvVnl4QmplME54N0NLY3RLczNhVXlEQzlDa1cxdXlySGdjMVBjZW5B?=
 =?utf-8?B?SjNJQXQ0UTN4OFVEcUNXdFcrLzBJWWdBWXJBZnYwUEttUFVxSzV6WlpHUjJX?=
 =?utf-8?B?TS9pajFlV2ROVmdpREFWTHk5cEV2NUZZVXllL1JuWVBWQTluQmloQ3doU3U2?=
 =?utf-8?B?NlBQNU1iMzdMU3RLNGRIbVV3b1pPSWVJWVlHbkVydElyYmV6d2Q5bmNuc1RZ?=
 =?utf-8?B?UG8yKzZyS0l5SmVyUFhXL2pOdHk3VVJQZ2hLN3VBOU1TZm1jdlJPYjBTQ25t?=
 =?utf-8?B?c3JKc0F1aWdSOHpJZk5zQU56K0loOW5kSXFqdTBxazZEL2ZsTG9KN0tsVXQ1?=
 =?utf-8?B?UEFGcEFzTHFmZDRQbGhJd0NlQWk0clI3QmI5MHBNMFd5K3BWT1FKYy9xWEpY?=
 =?utf-8?B?aUlTajVzcklsMzVMc2c3dDU5K0dhOW8rVDh4VnpFdExFb3ozQlMyM1o4eGF0?=
 =?utf-8?B?N1dqV2dxdkFaaU10TGpUbWhWc0dlOCtNcm5DaHp1aitITEZvaWVhRzE0dlNj?=
 =?utf-8?B?L0ZPakR5OWo4OVYxOUNUQ0tlUm9rTVZkWkxHeDhpc2pUUm9EZUVNNEE5S3Ru?=
 =?utf-8?B?RGE2aVorZWdqWDRQRUV0YkZMNnBGd3R3VmFveHNrSGtvSDVpMWVVNHo3cVBW?=
 =?utf-8?B?Y0loNEJRanBsdXhhaFltb3JBUGxYSXFrSHNFU3RJY1ZRdERQYkh0M0doQ1hw?=
 =?utf-8?B?WUNrdFFpck1aWnJtQVpYUXdDUGtiSzRISTI0cnFNQll6ZlI4YnRoZVdnTXEz?=
 =?utf-8?B?R2J1c0d2ZzRLako0dEtwcjh1bkxQNnZZQUJRWCtBYnJFc1IxSHIvM0JGWmdp?=
 =?utf-8?B?K1lzNG43NDRqNnhXMnpkbDR5TGVYUnhBazU4OEJHcjJrWEFvZDJIRnVLTDJh?=
 =?utf-8?B?SHZ0MVBubExxQTJWcWJLVUV4TnlVRHpDaUVYdGxPMHlFRXo0MjlSUC9yb1Ur?=
 =?utf-8?B?Z0lSbnQxcFdhbFdOZENYRENFNkVNbmhOUDlmenBWcy9WNUozN2JPZlY3bzdo?=
 =?utf-8?B?Ny8veExvRWF6UXNlOVJqODYxZ0N1YnY3YnF1OTJxM1lMTTRuTGVzK2xaRytU?=
 =?utf-8?B?eDZOcUROR0NXUnY1Ymw5S3B3Qi9LUCt0OGtFSHF6cERFNEtDTGZ5c2k0SE5Z?=
 =?utf-8?B?Qzh1YUVlM2Q3c09JUDJtUEMzSytYSGF3dnpRNC9CZnRtZkZjV3VTQnFCM3pR?=
 =?utf-8?B?bjRBMjlBUWxaYk1udDEzKzY1Z3QrVnRwMER3M0VWa0plSkQwNTBFVFFxcW9G?=
 =?utf-8?B?UGRkQjhWbER1dm9lOWxCbVNoa0ZTRktmajVvWGhwQkNwcDhNaVlpNkhhTFl5?=
 =?utf-8?B?SUhhZ1I2cHJiRTRLQUV4dGplbDRYQmhpUTRxVUUyU0ZoeEhuQVMvZHAxSXdt?=
 =?utf-8?B?NmY5UytGMGNDbnpDVXI1UnFWN1hJYXY1cHdmbHFBRWlLNFhtVjlreldqQ1FP?=
 =?utf-8?B?TGxYUVVlcEFOZUwvczlkdjNQa1Vmb1pPN1AxYWFMbGJ1ajZ4aGZDUFFacU5M?=
 =?utf-8?B?MStIWEFoZ3JnTjhGcFhzSTBWY3dsWlFpN1VDVmRTUmtlYmExT3M1REswYXlW?=
 =?utf-8?B?SVE3NUdEMGhRWkFzVEJ3QS9CaTQ5NVNUWFhMNllRQVFQZFh2OXRqb1ZWR3VQ?=
 =?utf-8?B?ZjVmeEVxMlRMMVdsZ0hyZ1JMSVAyNWs5b1ZnTWhpcDNJTzVuZjRuUW9YTm9w?=
 =?utf-8?B?T0NIYUhscFZ4eUJ3TTE2UFI0THV3aU9DNFhsbVRmb1Z0eFp0WEpMMVhpTU1k?=
 =?utf-8?B?WWN4Z25MTWo3cGlDRlUwSXZieWQ0NFhyL0RHMFNmb1FFdXlpdWlmWTZlSGtT?=
 =?utf-8?B?UVM3SGh1U2V0ZXE1NHNycTByQ3J4MFI4eE9EMTV4VWt0SnBWWENaeEU0SmlX?=
 =?utf-8?B?ZWlQS2k5UzAzYUNIcFRmRjdYM0ttWFNzVWswbldFS1FHU2Z4SVc5YmVJb2ht?=
 =?utf-8?B?eDVnWnN1U2oyZEdQbXFNRHlIVlZCODhjaGIwd2dYNkUzUElFeCtrVytHMDdt?=
 =?utf-8?B?MzdkWVlaNVpycUdHUWRyVTdxZ2VlRnNPdFJHMHhXM1ByeVJwV0h2dnBaY2lD?=
 =?utf-8?B?RUZSRDBaM2wxU3QyZ3Fmb1d4SVFDbU53eHNlTUU3dTBraVowbTFJcFFxc0dS?=
 =?utf-8?B?TmtnbW1DWjVia3FEWUh3TG5OTkZPN0VEZU93eDcvcTBRcjc0RG9Pa2w2NXRB?=
 =?utf-8?Q?Haw4aJFQaCaFef7H+a?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e588ff69-1d06-499b-5e66-08de74290816
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 04:47:51.0767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tm6sw/jsRfaLpvuXC0lRI8X56QyqWMs+2167j1tvaD8xXIy9NtqxIaMSSkDKvC7KMCte8neO2rpZxi+E1973cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7467
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOYWxhZGFsYSwgUmFtYW5haWR1
IDxyYW1hbmFpZHUubmFsYWRhbGFAaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5
IDIzLCAyMDI2IDk6MDQgUE0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBCLCBKZWV2YW4gPGplZXZhbi5iQGludGVsLmNvbT47IEpvc2hpLCBLdW5hbDEgPGt1bmFs
MS5qb3NoaUBpbnRlbC5jb20+Ow0KPiBNYW5uYSwgQW5pbWVzaCA8YW5pbWVzaC5tYW5uYUBpbnRl
bC5jb20+OyBOYWxhZGFsYSwgUmFtYW5haWR1DQo+IDxyYW1hbmFpZHUubmFsYWRhbGFAaW50ZWwu
Y29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgdjFdIHRlc3RzL2ttc192cnI6IEF2b2lkIExP
QkYgZGVidWdmcyBsb3NzIGJ5IGNoZWNraW5nDQo+IGR1cmluZyBhY3RpdmUgZGlzcGxheQ0KPiAN
Cj4gQWRqdXN0cyB0aGUgcGxhY2VtZW50IG9mIExPQkbigJFyZWxhdGVkIGNoZWNrcyBzbyB0aGV5
IHJ1biB3aGlsZSB0aGUgZGlzcGxheQ0KPiBwaXBlbGluZSBpcyBzdGlsbCBhY3RpdmUuIFByZXZp
b3VzbHksIHRoZXNlIGNoZWNrcyB3ZXJlIGV4ZWN1dGVkIGFmdGVyIHRoZSBkaXNwbGF5DQo+IGhh
ZCBhbHJlYWR5IGJlZ3VuIHNodXR0aW5nIGRvd24sIGNhdXNpbmcgdGhlIGRlYnVnIGluZm9ybWF0
aW9uIHRvIGJlY29tZQ0KPiB1bmF2YWlsYWJsZSBhbmQgcmVzdWx0aW5nIGluIGZhbHNlIGZhaWx1
cmVzLg0KPiANCj4gTm93IGNoZWNrcyBhcmUgbW92ZWQgdG8gYSBzdGFnZSB3aGVyZSB0aGUgcGFu
ZWwgYW5kIGxpbmsgcmVtYWluIGVuYWJsZWQsDQo+IGVuc3VyaW5nIGNvbnNpc3RlbnQgYWNjZXNz
IHRvIExPQkYgdGVsZW1ldHJ5Lg0KPiBJbml0aWFsaXphdGlvbiBhbmQgY2xlYW51cCBvZiBzdXBw
b3J0aW5nIHJlc291cmNlcyBhcmUgYWxzbyBzdHJlYW1saW5lZCB0byBhdm9pZA0KPiByZXBlYXRl
ZCBzZXR1cCBhbmQgdGVhcmRvd24gZHVyaW5nIGV4ZWN1dGlvbi4NCj4gDQo+IEZpeGVzOiA1NDY4
MDM1NjBhN2EgKCJ0ZXN0cy9rbXNfdnJyOiBleHRlbmQgbG9iZiB0ZXN0IGZvciBzdXBwb3J0ZWQN
Cj4gY29ubmVjdG9ycyIpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOYWxhZGFsYSBSYW1hbmFpZHUg
PHJhbWFuYWlkdS5uYWxhZGFsYUBpbnRlbC5jb20+DQpMR1RNLg0KUmV2aWV3ZWQtYnk6IEplZXZh
biBCIDxqZWV2YW4uYkBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMva21zX3Zyci5jIHwgMjYg
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfdnJy
LmMgYi90ZXN0cy9rbXNfdnJyLmMgaW5kZXggZjUwMGQ3YTU5Li41NjkwMDBmZWUNCj4gMTAwNjQ0
DQo+IC0tLSBhL3Rlc3RzL2ttc192cnIuYw0KPiArKysgYi90ZXN0cy9rbXNfdnJyLmMNCj4gQEAg
LTkwMyw2ICs5MDMsMTYgQEAgdGVzdF9sb2JmKGRhdGFfdCAqZGF0YSwgaWd0X2NydGNfdCAqY3J0
YywgaWd0X291dHB1dF90DQo+ICpvdXRwdXQsDQo+ICAJcHJlcGFyZV90ZXN0KGRhdGEsIG91dHB1
dCwgY3J0Yyk7DQo+ICAJZGF0YS0+ZmxhZyB8PSBmbGFnczsNCj4gDQo+ICsJaWYgKGZsYWdzICYg
VEVTVF9MSU5LX09GRikgew0KPiArCQlpZiAoIWlndF9oYXNfbG9iZl9kZWJ1Z2ZzKGRhdGEtPmRy
bV9mZCwgb3V0cHV0KSkNCj4gKwkJCWlndF9za2lwKCJpOTE1X2VkcF9sb2JmX3N0YXR1cyBub3Qg
cHJlc2VudCBmb3IgJXNcbiIsDQo+ICsJCQkJIGlndF9vdXRwdXRfbmFtZShvdXRwdXQpKTsNCj4g
Kw0KPiArCQlpZiAocHNyX3Npbmtfc3VwcG9ydChkYXRhLT5kcm1fZmQsIGRhdGEtPmRlYnVnZnNf
ZmQsDQo+IFBTUl9NT0RFXzEsIE5VTEwpIHx8DQo+ICsJCSAgICBwc3Jfc2lua19zdXBwb3J0KGRh
dGEtPmRybV9mZCwgZGF0YS0+ZGVidWdmc19mZCwNCj4gUFJfTU9ERSwgTlVMTCkpDQo+ICsJCQlw
c3JfZGlzYWJsZShkYXRhLT5kcm1fZmQsIGRhdGEtPmRlYnVnZnNfZmQsIE5VTEwpOw0KPiArCX0N
Cj4gKw0KPiAgCWlndF9pbmZvKCJMT0JGIHRlc3QgZXhlY3V0aW9uIG9uICVzLCBQSVBFICVzIHdp
dGggVlJSIHJhbmdlOiAoJXUtJXUpDQo+IEh6XG4iLA0KPiAgCQkgb3V0cHV0LT5uYW1lLCBpZ3Rf
Y3J0Y19uYW1lKGNydGMpLCBkYXRhLT5yYW5nZS5taW4sDQo+ICAJCSBkYXRhLT5yYW5nZS5tYXgp
Ow0KPiBAQCAtOTk4LDcgKzEwMDgsNiBAQCBzdGF0aWMgdm9pZCB0ZXN0X2NsZWFudXAoZGF0YV90
ICpkYXRhLCBpZ3RfY3J0Y190DQo+ICpjcnRjLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkNCj4gDQo+
ICBzdGF0aWMgYm9vbCBvdXRwdXRfY29uc3RyYWludChkYXRhX3QgKmRhdGEsIGlndF9vdXRwdXRf
dCAqb3V0cHV0LCB1aW50MzJfdA0KPiBmbGFncykgIHsNCj4gLQlkYXRhLT5kZWJ1Z2ZzX2ZkID0g
aWd0X2RlYnVnZnNfZGlyKGRhdGEtPmRybV9mZCk7DQo+IA0KPiAgCWlmICgoZmxhZ3MgJiAoVEVT
VF9TRUFNTEVTU19WUlIgfCBURVNUX1NFQU1MRVNTX0RSUlMgfA0KPiBURVNUX0NNUlIpKSAmJg0K
PiAgCSAgICBvdXRwdXQtPmNvbmZpZy5jb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlICE9DQo+IERS
TV9NT0RFX0NPTk5FQ1RPUl9lRFApIHsgQEAgLTEwMTIsMTggKzEwMjEsNiBAQCBzdGF0aWMgYm9v
bA0KPiBvdXRwdXRfY29uc3RyYWludChkYXRhX3QgKmRhdGEsIGlndF9vdXRwdXRfdCAqb3V0cHV0
LCB1aW50MzJfdCBmbGFncw0KPiAgCQlyZXR1cm4gZmFsc2U7DQo+ICAJfQ0KPiANCj4gLQlpZiAo
ZmxhZ3MgJiBURVNUX0xJTktfT0ZGKSB7DQo+IC0JCWlmICghaWd0X2hhc19sb2JmX2RlYnVnZnMo
ZGF0YS0+ZHJtX2ZkLCBvdXRwdXQpKSB7DQo+IC0JCQlpZ3RfaW5mbygiaTkxNV9lZHBfbG9iZl9z
dGF0dXMgbm90IHByZXNlbnQgZm9yICVzXG4iLA0KPiAtCQkJCSBpZ3Rfb3V0cHV0X25hbWUob3V0
cHV0KSk7DQo+IC0JCQlyZXR1cm4gZmFsc2U7DQo+IC0JCX0NCj4gLQ0KPiAtCQlpZiAocHNyX3Np
bmtfc3VwcG9ydChkYXRhLT5kcm1fZmQsIGRhdGEtPmRlYnVnZnNfZmQsDQo+IFBTUl9NT0RFXzEs
IE5VTEwpIHx8DQo+IC0JCSAgICBwc3Jfc2lua19zdXBwb3J0KGRhdGEtPmRybV9mZCwgZGF0YS0+
ZGVidWdmc19mZCwNCj4gUFJfTU9ERSwgTlVMTCkpDQo+IC0JCQlwc3JfZGlzYWJsZShkYXRhLT5k
cm1fZmQsIGRhdGEtPmRlYnVnZnNfZmQsIE5VTEwpOw0KPiAtCX0NCj4gLQ0KPiAgCS8qIFJlc2V0
IG91dHB1dCAqLw0KPiAgCWlndF9kaXNwbGF5X3Jlc2V0KCZkYXRhLT5kaXNwbGF5KTsNCj4gDQo+
IEBAIC0xMDU3LDcgKzEwNTQsNiBAQCBzdGF0aWMgYm9vbCBvdXRwdXRfY29uc3RyYWludChkYXRh
X3QgKmRhdGEsDQo+IGlndF9vdXRwdXRfdCAqb3V0cHV0LCB1aW50MzJfdCBmbGFncw0KPiANCj4g
IAlkYXRhLT5yYW5nZS5taW4gPSBkYXRhLT5zd2l0Y2hfbW9kZXNbTE9XX1JSX01PREVdLnZyZWZy
ZXNoOw0KPiANCj4gLQljbG9zZShkYXRhLT5kZWJ1Z2ZzX2ZkKTsNCj4gIAlyZXR1cm4gdHJ1ZTsN
Cj4gIH0NCj4gDQo+IEBAIC0xMTY4LDYgKzExNjQsNyBAQCBpbnQgaWd0X21haW5fYXJncygiZHJz
OiIsIGxvbmdfb3B0cywgaGVscF9zdHIsDQo+IG9wdF9oYW5kbGVyLCAmZGF0YSkgIHsNCj4gIAlp
Z3RfZml4dHVyZSgpIHsNCj4gIAkJZGF0YS5kcm1fZmQgPSBkcm1fb3Blbl9kcml2ZXJfbWFzdGVy
KERSSVZFUl9BTlkpOw0KPiArCQlkYXRhLmRlYnVnZnNfZmQgPSBpZ3RfZGVidWdmc19kaXIoZGF0
YS5kcm1fZmQpOw0KPiANCj4gIAkJa21zdGVzdF9zZXRfdnRfZ3JhcGhpY3NfbW9kZSgpOw0KPiAN
Cj4gQEAgLTEyNDMsNiArMTI0MCw3IEBAIGludCBpZ3RfbWFpbl9hcmdzKCJkcnM6IiwgbG9uZ19v
cHRzLCBoZWxwX3N0ciwNCj4gb3B0X2hhbmRsZXIsICZkYXRhKQ0KPiAgCX0NCj4gDQo+ICAJaWd0
X2ZpeHR1cmUoKSB7DQo+ICsJCWNsb3NlKGRhdGEuZGVidWdmc19mZCk7DQo+ICAJCWlndF9kaXNw
bGF5X2ZpbmkoJmRhdGEuZGlzcGxheSk7DQo+ICAJCWRybV9jbG9zZV9kcml2ZXIoZGF0YS5kcm1f
ZmQpOw0KPiAgCX0NCj4gLS0NCj4gMi40My4wDQoNCg==
