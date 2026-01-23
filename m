Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C65D74EC3
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 12:57:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E21D10E2BF;
	Fri, 23 Jan 2026 12:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZaIJq6hm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7896010E2BF
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 12:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769173045; x=1800709045;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LsgYmM6nLTlllYKGi2U1KqNvDgxmpEZR0U76nZyM+z8=;
 b=ZaIJq6hmFyZmUpNLsLIGJXvBC0wJ6u/bPOyPnBEaaZAwRdpQlqrq2oHV
 ithVdQtseseHZ6Unca3fz+kztTQN1Xb+fgYe+VexIzaiwzATEtz/pCfKz
 /3lnVos3rgsNzCkza/yacYu1ehrNUDGueJGHw9xYquOO/rtWMMz1J5ri8
 UIZN3IWGWkI+oF0GcdCDJMyITLS5ziQx7BZNFeocUmM7gAuvafzSHGrLA
 lAnxxqprk+ciS2mXRWyGFjyzu6Xzf6VZcGYc5vk3FgdZgbUVuLxDaJ6MG
 YfqiSFluh0lXnVneOQufbOU4zuXqAACV+nVuClUJ/wD6L5a+bqVNGYvOO w==;
X-CSE-ConnectionGUID: +9wfWHqXQ8eU34GeP9j5AA==
X-CSE-MsgGUID: YldLFixQReqPH7WU6plGxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="88002580"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="88002580"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 04:57:24 -0800
X-CSE-ConnectionGUID: LR8GiZJ0TLWTpdwjpjZ78A==
X-CSE-MsgGUID: R1cLXHaTS+KPp/TMJcUeyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="237673077"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 04:57:24 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 04:57:23 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 04:57:23 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 04:57:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMULMh9EiX4xh0irNBJQ5ZAb+VjtOPx5nSJcj/c2rAYGVlO+dQDufdbezJVELwh6YC23jVUeb7VpcHfmLZu2Z2KDIzHsIm+VADc5+83fk7u5Hvva4ZQJ/L3/da+xQA4cwzLII+RQuqfK3yzBu0cJrXHMCKhUbBCn5tRfPu9pjyYHcCvMjLR2gCIY8UR3PFz+Cmmauj6r73kIrlMFG5+YJL78P+/iaW0pTkIQqJ48lVhBaaqSIUkYXkZ9F4zXxctcYdiUFF4qL+qQBxarpwCiQxU7aRzMUIqHCqaN9STwIMUDmno8LUZew8oEkyt/BzGJKfgLOGgniYwbJ7gEOO4igg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsgYmM6nLTlllYKGi2U1KqNvDgxmpEZR0U76nZyM+z8=;
 b=Gi5mI3E0CjOKH1i9tZFniRJZsnvOKQ+Fqc+bPe5QjOR47IyZPDxdSnHW8QMJQ/lfCBigJ/UDW4YhH7vSJbZhRJfUDE1c3ME8wl1ZOQOCVu9zrx678OYM44Vw/q50GOf1a+7cGtkteMyyH5UY2Md5AP0qoqiI3Gs6aS1795AsuYKAAQrjUiLBVtizesq8bMlo1df/KaIkkW8mvkmKcHz5N2tc8Xr3YDZe8cl+IDMuPNP6oTOBfYeXG/3iFo5uZ/Q2FOpOfdWgXZRzGTuDJw/ji8chQKvJSIXrNyyB70etyVLR9qRx+k0+DgonvE3ECzknt7H0JZBzCV4+xKqvkpRMRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 DS7PR11MB6295.namprd11.prod.outlook.com (2603:10b6:8:95::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 12:57:15 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 12:57:15 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v3 1/1] tests/xe_eudebug_online: Extract workload
 start helpers
Thread-Topic: [PATCH i-g-t v3 1/1] tests/xe_eudebug_online: Extract workload
 start helpers
Thread-Index: AQHcjGcngOu5GYzCA06jZYiTRwBTfLVftqMA
Date: Fri, 23 Jan 2026 12:57:15 +0000
Message-ID: <DS0PR11MB726400FCE451DE74B2C79B30D994A@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20260123125342.311645-2-piotr.rudnicki@intel.com>
In-Reply-To: <20260123125342.311645-2-piotr.rudnicki@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|DS7PR11MB6295:EE_
x-ms-office365-filtering-correlation-id: 8e468083-20b4-46b2-7b7e-08de5a7eeedf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?MTFaaENYdlZvaGx4RWh1V3RvS3NVMmZhVDVLWlRoc1JIcGIwNEs0QS94ajJk?=
 =?utf-8?B?dVZTcFlIV1JBdFdQNklRa2JuWnJPK3BPQkRCQjdoQkhxUXNGbTJWcHNRU0dw?=
 =?utf-8?B?cmRLRXorbk1XeTJYa25SWk53VGk1U2s2bEtpaXI2M2JPSTNYY2RqSkVUdkcz?=
 =?utf-8?B?VlJYcEZQYkFFbDFJYnN5RW9NV0xCdU5XQ0NsNlpDak9OcnR6QWRSSzI4TjBC?=
 =?utf-8?B?K2srNStXc3BLY051YkpoQXpXeDdhdmc1MVNMcjJ3dVk1aXliYTV1WDlmU25W?=
 =?utf-8?B?b1lSRXBWb0hYV1lNZEJ3ZitRTUJiS0RJTG8xTlFleHZuQ04zanJobUlqQXNC?=
 =?utf-8?B?OUg0eEpmbm5ONzBEblVSSHVKN1BjekdldmdLejNXKzljSFBXNGxCSjlXSm13?=
 =?utf-8?B?cENQZE8zOWo0OFpWRzYwcEtJaXRqNEd1S2NYQzNnR0FVNUVMR0IzMGxkQUpr?=
 =?utf-8?B?SXNQVnBSQkcxR2RlQUlJMVdqSjAwVGtpSjdmUEQ4WE1UZnZWZkp3aW9Rem84?=
 =?utf-8?B?Y2FlZGUxRVhPS0dWeERtNjZzMGwvNXRxaXBpaUkxdS9UVUtDaTdpQnd5bDhX?=
 =?utf-8?B?RWw5SmI5d3ZxcS93Z2Q4b0k1QjRnTGhRUHNLYmJhbk0zMmh4K2J5bFZ1YVM5?=
 =?utf-8?B?WTc4QzZVTkFROVZUZGM0b0ZFRXptUk9MenlrYUNxaHh5NGlqL01OenpMMUdS?=
 =?utf-8?B?NHZIQXhseG90S200TXNNeGpJbVdWRi85NHhZcmJMMUlHaGlHQWlib0h2a0tN?=
 =?utf-8?B?WWlySFhacTNBWkZDZEtJb1pGUTVOOFVkeEVXRjFFV2JJTldTNk9HV1Arenht?=
 =?utf-8?B?OFEzaUl2TExUcHdxNkxNSkM5aGJITGU2RHR1b3V0WkNWa3JKd1h5WnQxWTZK?=
 =?utf-8?B?QWk2aEVCWFQwU0hkMUVxVUJsMDRmcVJXS1ptcFQ0SWVTMDlSbzlkblBpSXNV?=
 =?utf-8?B?MUFxL21BSkp4aWkxS0dJZ1Z1MkdsdU5VT3dENTNTeS9kOWhKdjVLUEhHY1Y0?=
 =?utf-8?B?YnhMRnZPRWYzRnVmcHFKcEc4aGNCbzRHNEhXcTljUFpHWG4wUzRma1JwM2xD?=
 =?utf-8?B?MVhwWGVSMkZHeERRRUxZQnlOUlhkZWUrZzROQkFTYjhjT1d1Y2tWV21QWUZI?=
 =?utf-8?B?UlM2MlBMaHV1SkFXVmtxSjRrVFNoWjVPT3BzSUNWQU5iSitOMHpWUGtCQ1Fu?=
 =?utf-8?B?cldwWDh3Z3BhUDFQaHkwb25YWWpZU2NUaTduV2FIMkpROGhOMUdoYVNKS1kv?=
 =?utf-8?B?bkdWRGdCVVJWalZoTHNjc0JnRFFwc1lTZXltVHR2bU9nUk1TMHJ4cHEvWGdB?=
 =?utf-8?B?QzNLWllKVnI2czZYS2pqZlBkZXc4c3VWOElvY09vM2JLVmZaSFFNN1lLejNM?=
 =?utf-8?B?UzRoUFBwV2dKQjc1S1lKdngyMGdaYVJ3b1grbzJIRUJGeEtzRmVWQ1RDdDdm?=
 =?utf-8?B?UDNWb3ZZY3Q3NzY3bXdxUUhYc0JKWlFWK1VwNzM5TFIwMGlQdSt2RXFMYzlz?=
 =?utf-8?B?dlN0Vk1iRnhiczZ5TWdaN0F0UFdJSzd0WGxvNTlHMWJpejNNd29qMFg1eDhT?=
 =?utf-8?B?Z2VmWVlhWDFpYmpGeC81NWR4eXNqbSs5ZEl4eE1nS0t6TzE0S1VicXVrM05n?=
 =?utf-8?B?K1pJQzVGa29WNkFyK1pTV2YwZmR3dXlXV0dTMnhJam5rZXJPQ2s0SUJIRGZp?=
 =?utf-8?B?eitjRVJ4TjhQYi83dzAwc1BQSnlrZVp2bkNFRFhLQ3YyeTVRMTNRN0o1NmxC?=
 =?utf-8?B?bHhHZmdyTFJ2THI1QkJENWZweUxHSElHQVNOcHR2NFQzdG5ZdVdNUFozQmRQ?=
 =?utf-8?B?Z05ybVFzaFhaY3FkcDY4bFJrWjJlWUtUeTN3WlF5MzVZTXcvV2lhNTNoRFBP?=
 =?utf-8?B?MThrYWJ1dGxXdUNXZmNFSW9aeFJaNk5kMjBvVEFXMllkbDlBeGVEcGVBZDkr?=
 =?utf-8?B?UzBkWHNwRjZxZFpyNkN2L3ZnNUxJNlBvL0czR3J5NGtnSEF0STVHU21mTmdr?=
 =?utf-8?B?WDFHajF1b0M4Y2ZjaTV5Ti9uNVo2Z2t3aHM0T08vRURjZEkwbUFkdUM0bVBV?=
 =?utf-8?B?bDJwN2hsK1JTanZ1akRvMXh4cVVOMFVrUWdHZlhVTjJMTnUzc25XbldMTFpP?=
 =?utf-8?B?czhHS0c1ekozdGcrMG0xd3RZSG5yckF6L3dMNUZ5QVBqMHJwZkp1MXFENGRI?=
 =?utf-8?Q?oAlmCDToGGxi7GT3ZDFPTQA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STJ4VUFaMnRqYmlDM09LVHNxYWxGZjhGQlREZUFUaTBDcWZHSTRjM3VJMXNa?=
 =?utf-8?B?bjNTUW9KaVBKZ1ZpOWNFS1BGQ2dyckU0eW90Z3d5WkwzUTdaUXA2S3JSL0cy?=
 =?utf-8?B?MEMweWhFRVlXL3ErRjdpOTR4OXNVL0N6Q3dLYStUbjNFSjkyVmoyT2xyVkZN?=
 =?utf-8?B?dm9XVkhRZ0JHcnVmYjBZZ1hXL3RlNVlaenJ0VXZucGc3UEo3aVRnMms3ajNh?=
 =?utf-8?B?TG41cytrZkRqRm1lVFY4NnpUTG5PbGpsUXRnM01zZ2VIcDhnQlpDZ2ZGWVo1?=
 =?utf-8?B?UGY1N0dDTlZWZ1gzQWttUkdUZ29XVVNscTBKYjRwOUlMbDMyS2RJZFo3SkVh?=
 =?utf-8?B?VS9UY3dIdG9zQTd3OWYxRmp4eWNuSURmOFJPM1lTU0dCRUdEd1VEOHNaV2lG?=
 =?utf-8?B?K3JFVklNVHVNOFdPVW1TSU9YNi80cVYvT2l3WWQ4bUV1Mm8zK2NqWEVKZ2Z5?=
 =?utf-8?B?cEFXaUkzZFRxYndjOUdqQlRQVDJhWVUzQmtDTnQzbjJUTTVOWjBYcUpBUmZs?=
 =?utf-8?B?MSswUnhENXRFZHlmaXVFL2lnWDdwNXFFekNwN2lRM1N4dEdpUHQ3Q3dIVGxy?=
 =?utf-8?B?STY4WlNUSENmbjlLS29kRXBNRkRKTmpSelhsVTdGcFAvZlVYUldFNmR3ZlhN?=
 =?utf-8?B?ZUtFbWVnZ2JCUUhCMGNzRzY4VkVsMFo5cXdRUHFRb25Dc0hpVGs2M2VMT0tI?=
 =?utf-8?B?T04rdkpBOHp6dXRMWlF2enZKY2tQQjNkK2YyRnEzMm8zREZuZDlzOEl2ei9F?=
 =?utf-8?B?WHF0azNoZXBXMGN4bzd1M0ZNQWhJcUg3SmdFOW9TWnlvcDdKRlh3RFFkYzBi?=
 =?utf-8?B?eVRMOWFobCtKRkNyV2drb2tOMU5EMlhNZEE4elF0VFVDaFJWNS9VaDVSR1VE?=
 =?utf-8?B?bWREUWlVNVBIcEY3czk0Vy9oaFRWR0F3bkhsU012c2pMZnJ1Q3FOTTdvcWNO?=
 =?utf-8?B?MGlXNWVuYTU4dGp1bi9ZZTJUNVJVcHpabFBpSnR1dnh4b1BGVm5BSVJKdHlo?=
 =?utf-8?B?K2N2aGtZZ1ZMcG04dDA2TWNKc3lNZzFkdmRJUkpjZkNMQ2JNQWg5MTFERnpE?=
 =?utf-8?B?N3VDeFVuYmZPQ1VWU3JBR3pxUXVIaVo0dk1sNGI0elpIUWVxYXhGdjJUcWto?=
 =?utf-8?B?Qm11NnhTeEMwM3FXWG1KMjBPcGdGUFZmOWh4WUZ5Q0lQMWNCQTdWTGZ5RWlD?=
 =?utf-8?B?bzBiczY2cStlWnlqVDdCa3JXR2JBZm01QkVIQm5PZ3paZ0ZrSmJTa1E0OW1I?=
 =?utf-8?B?L2pMbGxSbHhPd1ZxbGlJNDl5OWlTSmtETUhDRzl6N1RHR3duNkY4Y0pSSHpL?=
 =?utf-8?B?Q1ZrMjN1aWhqTGZGL3BERW01eXB1SmRZRFFoa2FHMkphZlY5YVhtVC9FTGNE?=
 =?utf-8?B?K2YwK0VkZzJmR2U4M0xULzJPcUZod2dEN3lzY1VXc0F2VXh5dGpIcWdWQzJv?=
 =?utf-8?B?VDFGSkt0S3FpS2xlWDU0aW9XZ0t5SGNrck4rNW5XVVQ4UWRsRWNGRWphZnpj?=
 =?utf-8?B?RzV0eWQ3ZEtmeFJQQndOREtLSHFmcHNYcW0yTnZiWG5FOXl5YVJ5alFKby9Z?=
 =?utf-8?B?Y1lFTE9FSWFLaDFyVWdyVXZrdjVDT2Y2NmhSTnhFMHZOd3dYUzRLcGE0UWth?=
 =?utf-8?B?OEFqWDdReHZOOW1Mdk1xNXA2QXllbk1TTmFNbVRjMUlhckdQWjhyR2NkdjJN?=
 =?utf-8?B?cUNHTVdHSWgvdmUrZHIwdHNjcXdRSU95MlB6Zmx6V1c3UFZkUlF2YWZBUE96?=
 =?utf-8?B?RWlqYmNReHJ5bzNnUnJzcTMxREJqYXJNV1o3ZE94M3h6VEVQVzA1ZlV2eXo2?=
 =?utf-8?B?QVFDN25tRDUwRWowRGUrZnQ4eHdDRzZhejlIdlJ5aGtqT2VZV0tzWGhuWG9C?=
 =?utf-8?B?bm9HT041SFhUMUJpQnlEZEFVVndZK3dFZ3BqTkVxbVV1eWs5cjBiQ2wrOGlw?=
 =?utf-8?B?SWNCakFkdEFJcTBrUTBURjVVV3c1bldzbks1WjJQeU9RRUgxYVh1RVh5OHNS?=
 =?utf-8?B?K3hrelBORHA3QVNweFRGTDVnOCtKcXFHZHVXNW00eFlrV3kvWThnSWFqM2Y5?=
 =?utf-8?B?M1BUUDZEbGNYbFZFY0E1T1VKMThXQ2VMZGRpQkg0SlR4SFZaQmNsOWVLejJl?=
 =?utf-8?B?Si9JQU5MNHJycDVxUG43b05YUG92bC93WEVQaFdBWGtNa0l0b1NqRTArQUpn?=
 =?utf-8?B?V3dtQzRlTUsvbmIybGVZZDVBM1M1YW5VWC9WZ29uYzE0MXo0c3NIUEFCNTZk?=
 =?utf-8?B?SUVxQW1FOEZ0QkhXdlhLY2RiTTJYNVhsdmJvSmFwdDkrTWI4RlNGTUxkUjRN?=
 =?utf-8?B?ZllVUkZOLzhZSEVMRXd2cXB3MDRxOURaeWk5bTZGbUxBdWZpTmJTUE5lZzNj?=
 =?utf-8?Q?rqB+2zdJ/WFTal3Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e468083-20b4-46b2-7b7e-08de5a7eeedf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 12:57:15.2657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sGYG9DHj0yY7P2QnZxPE5Zvc+5+tNnTqOSnF2P5nI3dzoNmQZxRpXqUKvbysLDJvuT1JevkCrhrsJgF49h19xwUbCbBy7XeIaYPafmgHG4fsWGYOYI4jLDXt4LX9FnG0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6295
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

SGkgUGlvdHIsDQoNClItYiBzdGlsbCBhcHBsaWVzLg0KDQpUaGFua3MsDQpEb21pbmlrIEthcm9s
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUnVkbmlja2ksIFBpb3Ry
IDxwaW90ci5ydWRuaWNraUBpbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgSmFudWFyeSAyMywg
MjAyNiAxOjU0IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzog
UnVkbmlja2ksIFBpb3RyIDxwaW90ci5ydWRuaWNraUBpbnRlbC5jb20+OyBQaWF0a293c2tpLCBE
b21pbmlrIEthcm9sDQo+IDxkb21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPjsgS29u
aWVjem55LCBLYW1pbA0KPiA8a2FtaWwua29uaWVjem55QGludGVsLmNvbT4NCj4gU3ViamVjdDog
W1BBVENIIGktZy10IHYzIDEvMV0gdGVzdHMveGVfZXVkZWJ1Z19vbmxpbmU6IEV4dHJhY3Qgd29y
a2xvYWQgc3RhcnQNCj4gaGVscGVycw0KPiANCj4gRXh0cmFjdCBkdXBsaWNhdGUgd29ya2xvYWQg
c3RhcnQgd2FpdCBsb2dpYyBpbnRvIHJldXNhYmxlIGhlbHBlcnMNCj4gd2FpdF9mb3Jfd29ya2xv
YWRzX3N0YXJ0KCkgYW5kIHdhaXRfZm9yX3dvcmtsb2FkX3N0YXJ0KCkuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBQaW90ciBSdWRuaWNraSA8cGlvdHIucnVkbmlja2lAaW50ZWwuY29tPg0KPiBSZXZp
ZXdlZC1ieTogRG9taW5payBLYXJvbCBQacSFdGtvd3NraQ0KPiA8ZG9taW5pay5rYXJvbC5waWF0
a293c2tpQGludGVsLmNvbT4NCj4gQ2M6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55
QGludGVsLmNvbT4NCj4gLS0tDQo+IFYxIC0+IFYyOiBVc2UgY291bnQrKyBhbmQgaW1wbGljaXQg
YXJyYXkgc2l6ZSBwZXIgcmV2aWV3IGZlZWRiYWNrDQo+IFYyIC0+IFYzOiBGaXggY29tcGlsYXRp
b24gZXJyb3JzDQo+IA0KPiAgdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYyB8IDgwICsr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDM2IGlu
c2VydGlvbnMoKyksIDQ0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2lu
dGVsL3hlX2V1ZGVidWdfb25saW5lLmMgYi90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5j
DQo+IGluZGV4IGZmNmM1ZmYxOS4uMDg0YmRlYjc3IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRl
bC94ZV9ldWRlYnVnX29ubGluZS5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25s
aW5lLmMNCj4gQEAgLTQ3MCw2ICs0NzAsMzggQEAgc3RhdGljIHZvaWQgb25saW5lX2RlYnVnX2Rh
dGFfZGVzdHJveShzdHJ1Y3QNCj4gb25saW5lX2RlYnVnX2RhdGEgKmRhdGEpDQo+ICAJbXVubWFw
KGRhdGEsIEFMSUdOKHNpemVvZigqZGF0YSksIFBBR0VfU0laRSkpOw0KPiAgfQ0KPiANCj4gK3N0
YXRpYyB2b2lkIHdhaXRfZm9yX3dvcmtsb2Fkc19zdGFydChzdHJ1Y3Qgb25saW5lX2RlYnVnX2Rh
dGEgKipkYXRhLCBpbnQgbikNCj4gK3sNCj4gKwlpbnQgdmFsOw0KPiArCWludCBjb3VudDsNCj4g
KwlpbnQgaTsNCj4gKw0KPiArCWlndF9mb3JfbWlsbGlzZWNvbmRzKG4gKiBTVEFSVFVQX1RJTUVP
VVRfTVMpIHsNCj4gKwkJY291bnQgPSAwOw0KPiArCQlmb3IgKGkgPSAwOyBpIDwgbjsgaSsrKSB7
DQo+ICsJCQlpZiAoUkVBRF9PTkNFKGRhdGFbaV0tPnZtX2ZkKSA9PSAtMSB8fA0KPiArCQkJICAg
IFJFQURfT05DRShkYXRhW2ldLT50YXJnZXRfc2l6ZSkgPT0gMCkNCj4gKwkJCQljb250aW51ZTsN
Cj4gKw0KPiArCQkJaWYgKHByZWFkKGRhdGFbaV0tPnZtX2ZkLCAmdmFsLCBzaXplb2YodmFsKSwN
Cj4gKwkJCQkgIGRhdGFbaV0tPnRhcmdldF9vZmZzZXQpID09IHNpemVvZih2YWwpICYmDQo+ICsJ
CQkgICAgdmFsICE9IDApDQo+ICsJCQkJY291bnQrKzsNCj4gKwkJfQ0KPiArDQo+ICsJCWlmIChj
b3VudCA9PSBuKQ0KPiArCQkJYnJlYWs7DQo+ICsJfQ0KPiArCWlndF9hc3NlcnRfZXEoY291bnQs
IG4pOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCB3YWl0X2Zvcl93b3JrbG9hZF9zdGFydChz
dHJ1Y3Qgb25saW5lX2RlYnVnX2RhdGEgKmRhdGEpDQo+ICt7DQo+ICsJc3RydWN0IG9ubGluZV9k
ZWJ1Z19kYXRhICphcnJheVtdID0geyBkYXRhIH07DQo+ICsNCj4gKwl3YWl0X2Zvcl93b3JrbG9h
ZHNfc3RhcnQoYXJyYXksIDEpOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgdm9pZCBldV9hdHRlbnRp
b25fZGVidWdfdHJpZ2dlcihzdHJ1Y3QgeGVfZXVkZWJ1Z19kZWJ1Z2dlciAqZCwNCj4gIAkJCQkg
ICAgICAgc3RydWN0IGRybV94ZV9ldWRlYnVnX2V2ZW50ICplKQ0KPiAgew0KPiBAQCAtMTkwMyw3
ICsxOTM1LDYgQEAgc3RhdGljIHZvaWQgdGVzdF9pbnRlcnJ1cHRfYWxsKGludCBmZCwgc3RydWN0
DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3ZSwNCj4gIHsNCj4gIAlzdHJ1Y3Qg
eGVfZXVkZWJ1Z19zZXNzaW9uICpzOw0KPiAgCXN0cnVjdCBvbmxpbmVfZGVidWdfZGF0YSAqZGF0
YTsNCj4gLQl1aW50MzJfdCB2YWw7DQo+IA0KPiAgCWlndF9yZXF1aXJlKCEoZmxhZ3MgJiBGQVVM
VEFCTEVfVk0pIHx8ICF4ZV9zdXBwb3J0c19mYXVsdHMoZmQpKTsNCj4gDQo+IEBAIC0xOTI4LDE2
ICsxOTU5LDcgQEAgc3RhdGljIHZvaWQgdGVzdF9pbnRlcnJ1cHRfYWxsKGludCBmZCwgc3RydWN0
DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3ZSwNCj4gIAl4ZV9ldWRlYnVnX2Rl
YnVnZ2VyX3N0YXJ0X3dvcmtlcihzLT5kZWJ1Z2dlcik7DQo+ICAJeGVfZXVkZWJ1Z19jbGllbnRf
c3RhcnQocy0+Y2xpZW50KTsNCj4gDQo+IC0JLyogd2FpdCBmb3Igd29ya2xvYWQgdG8gc3RhcnQg
Ki8NCj4gLQlpZ3RfZm9yX21pbGxpc2Vjb25kcyhTVEFSVFVQX1RJTUVPVVRfTVMpIHsNCj4gLQkJ
LyogY29sbGVjdCBuZWVkZWQgZGF0YSBmcm9tIHRyaWdnZXJzICovDQo+IC0JCWlmIChSRUFEX09O
Q0UoZGF0YS0+dm1fZmQpID09IC0xIHx8IFJFQURfT05DRShkYXRhLQ0KPiA+dGFyZ2V0X3NpemUp
ID09IDApDQo+IC0JCQljb250aW51ZTsNCj4gLQ0KPiAtCQlpZiAocHJlYWQoZGF0YS0+dm1fZmQs
ICZ2YWwsIHNpemVvZih2YWwpLCBkYXRhLT50YXJnZXRfb2Zmc2V0KQ0KPiA9PSBzaXplb2YodmFs
KSkNCj4gLQkJCWlmICh2YWwgIT0gMCkNCj4gLQkJCQlicmVhazsNCj4gLQl9DQo+ICsJd2FpdF9m
b3Jfd29ya2xvYWRfc3RhcnQoZGF0YSk7DQo+IA0KPiAgCXB0aHJlYWRfbXV0ZXhfbG9jaygmZGF0
YS0+bXV0ZXgpOw0KPiAgCWlndF9hc3NlcnQoZGF0YS0+Y2xpZW50X2hhbmRsZSAhPSAtMSk7DQo+
IEBAIC0xOTk2LDcgKzIwMTgsNiBAQCBzdGF0aWMgdm9pZCB0ZXN0X2ludGVycnVwdF9vdGhlcihp
bnQgZmQsIHN0cnVjdA0KPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpodw0KPiAgCXN0
cnVjdCB4ZV9ldWRlYnVnX3Nlc3Npb24gKnM7DQo+ICAJc3RydWN0IHhlX2V1ZGVidWdfY2xpZW50
ICpkZWJ1Z2VlOw0KPiAgCWludCBkZWJ1Z2VlX2ZsYWdzID0gU0hBREVSX0xPT1AgfCBET19OT1Rf
RVhQRUNUX0NBTkFSSUVTOw0KPiAtCWludCB2YWw7DQo+IA0KPiAgCWRhdGEgPSBvbmxpbmVfZGVi
dWdfZGF0YV9jcmVhdGUoZmQsIGh3ZSwgZmxhZ3MpOw0KPiAgCXMgPSB4ZV9ldWRlYnVnX3Nlc3Np
b25fY3JlYXRlKGZkLCBydW5fb25saW5lX2NsaWVudCwgZmxhZ3MsIGRhdGEpOw0KPiBAQCAtMjAx
NCwxNiArMjAzNSw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfaW50ZXJydXB0X290aGVyKGludCBmZCwg
c3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3DQo+ICAJeGVfZXVkZWJ1
Z19kZWJ1Z2dlcl9zdGFydF93b3JrZXIocy0+ZGVidWdnZXIpOw0KPiAgCXhlX2V1ZGVidWdfY2xp
ZW50X3N0YXJ0KHMtPmNsaWVudCk7DQo+IA0KPiAtCS8qIHdhaXQgZm9yIHdvcmtsb2FkIHRvIHN0
YXJ0ICovDQo+IC0JaWd0X2Zvcl9taWxsaXNlY29uZHMoU1RBUlRVUF9USU1FT1VUX01TKSB7DQo+
IC0JCWlmIChSRUFEX09OQ0UoZGF0YS0+dm1fZmQpID09IC0xIHx8IFJFQURfT05DRShkYXRhLQ0K
PiA+dGFyZ2V0X3NpemUpID09IDApDQo+IC0JCQljb250aW51ZTsNCj4gLQ0KPiAtCQlpZiAocHJl
YWQoZGF0YS0+dm1fZmQsICZ2YWwsIHNpemVvZih2YWwpLCBkYXRhLT50YXJnZXRfb2Zmc2V0KQ0K
PiA9PSBzaXplb2YodmFsKSkNCj4gLQkJCWlmICh2YWwgIT0gMCkNCj4gLQkJCQlicmVhazsNCj4g
LQl9DQo+IC0JaWd0X2Fzc2VydF9mKHZhbCAhPSAwLCAiV29ya2xvYWQgZXhlY3V0aW9uIGlzIG5v
dCB5ZXQgc3RhcnRlZFxuIik7DQo+ICsJd2FpdF9mb3Jfd29ya2xvYWRfc3RhcnQoZGF0YSk7DQo+
IA0KPiAgCXhlX2V1ZGVidWdfZGVidWdnZXJfZGV0YWNoKHMtPmRlYnVnZ2VyKTsNCj4gIAlyZXNl
dF9kZWJ1Z2dlcl9sb2cocy0+ZGVidWdnZXIpOw0KPiBAQCAtMjA4Miw3ICsyMDk0LDYgQEAgc3Rh
dGljIHZvaWQgdGVzdF90ZGN0bF9wYXJhbWV0ZXJzKGludCBmZCwgc3RydWN0DQo+IGRybV94ZV9l
bmdpbmVfY2xhc3NfaW5zdGFuY2UgKmgNCj4gIHsNCj4gIAlzdHJ1Y3QgeGVfZXVkZWJ1Z19zZXNz
aW9uICpzOw0KPiAgCXN0cnVjdCBvbmxpbmVfZGVidWdfZGF0YSAqZGF0YTsNCj4gLQl1aW50MzJf
dCB2YWw7DQo+ICAJdWludDMyX3QgcmFuZG9tX2NvbW1hbmQ7DQo+ICAJdWludDMyX3QgYml0bWFz
a19zaXplID0gcXVlcnlfYXR0ZW50aW9uX2JpdG1hc2tfc2l6ZShmZCwgaHdlLQ0KPiA+Z3RfaWQp
Ow0KPiAgCXVpbnQ4X3QgKmF0dGVudGlvbl9iaXRtYXNrID0gbWFsbG9jKGJpdG1hc2tfc2l6ZSAq
IHNpemVvZih1aW50OF90KSk7DQo+IEBAIC0yMTEwLDE2ICsyMTIxLDcgQEAgc3RhdGljIHZvaWQg
dGVzdF90ZGN0bF9wYXJhbWV0ZXJzKGludCBmZCwgc3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xh
c3NfaW5zdGFuY2UgKmgNCj4gIAl4ZV9ldWRlYnVnX2RlYnVnZ2VyX3N0YXJ0X3dvcmtlcihzLT5k
ZWJ1Z2dlcik7DQo+ICAJeGVfZXVkZWJ1Z19jbGllbnRfc3RhcnQocy0+Y2xpZW50KTsNCj4gDQo+
IC0JLyogd2FpdCBmb3Igd29ya2xvYWQgdG8gc3RhcnQgKi8NCj4gLQlpZ3RfZm9yX21pbGxpc2Vj
b25kcyhTVEFSVFVQX1RJTUVPVVRfTVMpIHsNCj4gLQkJLyogY29sbGVjdCBuZWVkZWQgZGF0YSBm
cm9tIHRyaWdnZXJzICovDQo+IC0JCWlmIChSRUFEX09OQ0UoZGF0YS0+dm1fZmQpID09IC0xIHx8
IFJFQURfT05DRShkYXRhLQ0KPiA+dGFyZ2V0X3NpemUpID09IDApDQo+IC0JCQljb250aW51ZTsN
Cj4gLQ0KPiAtCQlpZiAocHJlYWQoZGF0YS0+dm1fZmQsICZ2YWwsIHNpemVvZih2YWwpLCBkYXRh
LT50YXJnZXRfb2Zmc2V0KQ0KPiA9PSBzaXplb2YodmFsKSkNCj4gLQkJCWlmICh2YWwgIT0gMCkN
Cj4gLQkJCQlicmVhazsNCj4gLQl9DQo+ICsJd2FpdF9mb3Jfd29ya2xvYWRfc3RhcnQoZGF0YSk7
DQo+IA0KPiAgCXB0aHJlYWRfbXV0ZXhfbG9jaygmZGF0YS0+bXV0ZXgpOw0KPiAgCWlndF9hc3Nl
cnQoZGF0YS0+Y2xpZW50X2hhbmRsZSAhPSAtMSk7DQo+IEBAIC0yMjM3LDcgKzIyMzksNiBAQCBz
dGF0aWMgdm9pZCB0ZXN0X2ludGVycnVwdF9yZWNvbm5lY3QoaW50IGZkLCBzdHJ1Y3QNCj4gZHJt
X3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZQ0KPiAgCXN0cnVjdCBkcm1feGVfZXVkZWJ1Z19ldmVu
dCAqZSA9IE5VTEw7DQo+ICAJc3RydWN0IG9ubGluZV9kZWJ1Z19kYXRhICpkYXRhOw0KPiAgCXN0
cnVjdCB4ZV9ldWRlYnVnX3Nlc3Npb24gKnM7DQo+IC0JdWludDMyX3QgdmFsOw0KPiANCj4gIAlk
YXRhID0gb25saW5lX2RlYnVnX2RhdGFfY3JlYXRlKGZkLCBod2UsIGZsYWdzKTsNCj4gIAlzID0g
eGVfZXVkZWJ1Z19zZXNzaW9uX2NyZWF0ZShmZCwgcnVuX29ubGluZV9jbGllbnQsIGZsYWdzLCBk
YXRhKTsNCj4gQEAgLTIyNjAsMTYgKzIyNjEsNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2ludGVycnVw
dF9yZWNvbm5lY3QoaW50IGZkLCBzdHJ1Y3QNCj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5j
ZQ0KPiAgCXhlX2V1ZGVidWdfZGVidWdnZXJfc3RhcnRfd29ya2VyKHMtPmRlYnVnZ2VyKTsNCj4g
IAl4ZV9ldWRlYnVnX2NsaWVudF9zdGFydChzLT5jbGllbnQpOw0KPiANCj4gLQkvKiB3YWl0IGZv
ciB3b3JrbG9hZCB0byBzdGFydCAqLw0KPiAtCWlndF9mb3JfbWlsbGlzZWNvbmRzKFNUQVJUVVBf
VElNRU9VVF9NUykgew0KPiAtCQkvKiBjb2xsZWN0IG5lZWRlZCBkYXRhIGZyb20gdHJpZ2dlcnMg
Ki8NCj4gLQkJaWYgKFJFQURfT05DRShkYXRhLT52bV9mZCkgPT0gLTEgfHwgUkVBRF9PTkNFKGRh
dGEtDQo+ID50YXJnZXRfc2l6ZSkgPT0gMCkNCj4gLQkJCWNvbnRpbnVlOw0KPiAtDQo+IC0JCWlm
IChwcmVhZChkYXRhLT52bV9mZCwgJnZhbCwgc2l6ZW9mKHZhbCksIGRhdGEtPnRhcmdldF9vZmZz
ZXQpDQo+ID09IHNpemVvZih2YWwpKQ0KPiAtCQkJaWYgKHZhbCAhPSAwKQ0KPiAtCQkJCWJyZWFr
Ow0KPiAtCX0NCj4gKwl3YWl0X2Zvcl93b3JrbG9hZF9zdGFydChkYXRhKTsNCj4gDQo+ICAJcHRo
cmVhZF9tdXRleF9sb2NrKCZkYXRhLT5tdXRleCk7DQo+ICAJaWd0X2Fzc2VydChkYXRhLT5jbGll
bnRfaGFuZGxlICE9IC0xKTsNCj4gLS0NCj4gMi40My4wDQoNCg==
