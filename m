Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37C5606A329
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TYomSbOT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A3F10E01F;
	Thu,  5 Nov 2026 10:58:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4FB10E01F
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 10:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793876227; x=1825412227;
 h=content-transfer-encoding:date:message-id:subject:from:
 to:cc:references:in-reply-to:mime-version;
 bh=nVUTbwiFC4u/r3w+f3bm5FHHVLuge3mfRlLJuZqnvis=;
 b=TYomSbOT+yWy0qtYal568SGKTxN9HfcK/XMoDCRNtRMj8+BQpLGf4VnB
 XCGOXzLj5dnoTRs/AkU2pqTbOnMZHxb0bggzfSIBU/bqPiOg38xReEGMj
 2zYFSerDpTLBOklxht8VZ2pcHLKLRSubmTaqdNbaIRMht9rlKaJx38i68
 Fu9iHjcmigjRBq8f7ZwEAHUE2GQsrNzXuZtW08oh88CulzON8tPjoWIuf
 hjAa2kXi/bRshsIpaLSP0/ZbRaRJYzjoLwDmFjbZcjSEkrxGpOb+GZ+2K
 bWutlktI5MTnoCLtVaL2EScJUS0vsMzr0unZfspg8WGKS4QE8a/Peow+u w==;
X-CSE-ConnectionGUID: cBD6AJM+RuqxTixo8AL5sg==
X-CSE-MsgGUID: 7GHJJe9hS8m9Kx38BNCGEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2566538"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2566538"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 02:57:07 -0800
X-CSE-ConnectionGUID: 2TZQWPpKRNyy/bJWMGVg5Q==
X-CSE-MsgGUID: dvItfnudQxyEWtdna6gqOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7386087"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 02:57:06 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 02:57:06 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 02:57:06 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 02:57:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfNidSPLgRzb7E4DjLn4ZHs8Kwniy41LK1Zjb5KnEfyHMbE8xjLXpiJ61jYvgeadqhw7LSZNwwxdHQblW4NbJHWbYOLp1jZgrvpz/klF3KsqZnSb45sUKgF2QJ7Qb1Y6vkDkRaIyb4cm3aTRzkJsC76VgBwN9SRjaIFSUt21tM3RJEXO5LF6Sn4l9Y95UxTbxfSTpdfpxCtob7doTKRMLhhwcvQzxRhJfX43RHUeXdBe+cv6RiKUAgeyYwLMaWlneaC3VrP2xWNL3FM+6w6gn0zA8F5UuQlq/nVEjQxbwzvOKnBRAhTKG3yJnm4Mf5NesNLSLhZWr6R6e5UtI+B8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVUTbwiFC4u/r3w+f3bm5FHHVLuge3mfRlLJuZqnvis=;
 b=w18oeRIJD/XyvYbXc/rV96Phx8Mor8UApZX37CcRZ3L1GlB4u7sJX8yZ61tF0A1TdlfId47oL6wXbQh/wnFNf5NHxYLHSVUnQ8KSHgc78vxDmlG4+5XFaxi5U4OjeF8AB2RzglncRiWjgfbyA/4wvtz6FFsM1omEY6E9Hi9RX+vD07hWDP6g+cg9VTbPI076NWK8JbekN7ZMidolrYrwdErKZnOok7Om7wgP0tmVVPlV2kLGBiuniwPdQPoOTKUxMHYQGmFsnqNWguPODuSyP+RqCsIt9pZ04MbRzgumL0oAMI4IeKGFbmUYyoY2mRtTDQ3EGg3USCpANhygNfxprg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB134916.namprd11.prod.outlook.com (2603:10b6:8:4f0::21)
 by SJ2PR11MB8422.namprd11.prod.outlook.com (2603:10b6:a03:542::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 10:57:04 +0000
Received: from DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4]) by DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 10:57:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 5 Nov 2026 11:56:57 +0100
Message-ID: <DMN81PMG934A.3W1P5EQFBJ9XU@intel.com>
Subject: Re: [PATCH] tests/intel: Add edge case and race condition tests for
 GEM_CHANGE_HANDLE
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, David Francis
 <David.Francis@amd.com>, <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Christian Konig <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>
X-Mailer: aerc 0.22.0
References: <20261007141209.2928162-1-David.Francis@amd.com>
 <b9ffe1b9-1a65-45bd-858b-74f6ddd40a3b@igalia.com>
In-Reply-To: <b9ffe1b9-1a65-45bd-858b-74f6ddd40a3b@igalia.com>
X-ClientProxiedBy: VI1PR07CA0286.eurprd07.prod.outlook.com
 (2603:10a6:800:130::14) To DS4PR11MB134916.namprd11.prod.outlook.com
 (2603:10b6:8:4f0::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB134916:EE_|SJ2PR11MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a0f1532-9735-4771-5762-08df3b2b86b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|11063799006|56012099006|261021123027099003|261102130727099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: T1tb9IuDG+bBcMwQ/NYJyA0TgaqEzmwIJLaFbPJCZQ+zr1MXT2b3riIkMn4ppKHTvkxVMxrEX0HywigrqJR5+79yxOyyyJXoysS7BiX61n5CuJlfPJwVjlRpVLVby4CC865qrMii9MOX0t6NIDBZelRLEpc6E9i9L3xjkI3pJgdPsCk0JIHQQIjARTMa2hWFgYvt8zaDuCq9V9PCrxe9gP4b0xLpe4ekw6eytCSFtmrHPlkkJ/5A8mOwD5X8OaBNzP24yoCCNJFIPuHTWqBbMK0wlu7g1agcMvLzb0httdiZ0/M6CCITjNxM7X5Woh4pCR8xz+Wp6yQBWAZNUUQzXd0BMAJvJgNHU7A6MkC1ijzVpI4OHukpyXGoQUlDz3IBwZJgzYQWBXzfU/Pft7hrU7EpH+2xyckHkWqcv6Oq8toiE2WedXERMkb2sIo2PCESuWfvh5eYmy0Vnhtiz/XLXABDq0I3Qzvy2PyK8isFW1fXHNerI97tbB6dQmR/rXoxMhcf6y1ohtOAWWIe8DOOsk9i0/GEhSo1CZSE5y3yzSWi+4Ix7sPH3yPwRDhCyOtdWkICKma5p4yke9bVC1cFV1p7LspIuid+3qZSHw32RW0h9ScfFcpNF29YyIErtk94yn4VUzUXguA0UMNuM3ngadx3vx4Uz9kk6AakrV/n1NE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB134916.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(11063799006)(56012099006)(261021123027099003)(261102130727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2ZMY0tDcnlUTEdyMEFTQ1hrUWVhUHNOaVBiUkNnOWFPdjJUT3dlbDJONk55?=
 =?utf-8?B?QWpUZ2pVRmhDNVRNTFFFVXJLbk5MM1pERjJPQXVvTkFOcGF6ZXNvTVhvVGhx?=
 =?utf-8?B?QUUzVlRUSmZ3S2tremxWT1FWanZUcGdlLzFhNjRkd1hCZ0x6dFRHZ3RYeXB5?=
 =?utf-8?B?WW1IWDNOTzNrTVhhenpMQWNYcXl6RjkxU0NIdFdxb1dZak1aQ1FpRXNmR3ZH?=
 =?utf-8?B?VjRRdmpKVnZpZmdnR2MwK3hLZnFSVDF3bDVlYktoOE9oM3oxSDZhQzFpZjQ5?=
 =?utf-8?B?bzRzRnM5UmZ2Syt6ZHBDTkVkWk82RnZNTC90WlVFdnZlSlYwQWs2NVUxUFoy?=
 =?utf-8?B?cG00VE80K0FYdVdFd29MWlFtR3J0ejhuclJmYlQrS3RPanViTGVDa2VaL2JY?=
 =?utf-8?B?SWM3c092dmxFRGZWUm1qZW9vcTdRblA1UWJKZDZ2b1NPUklXbEpWNXFWRHFr?=
 =?utf-8?B?YlM4MjdKTGIvdS9PVC9QMkhxY2U4dFNCVW9FVDd4UkIzL3JFeFdhTzRFR0Y1?=
 =?utf-8?B?TUFzQU0rd1dNamtQTk1qTWt4djhzMkpVMEZ4YUoxeDhuMXV6UEFyMkx5R3pI?=
 =?utf-8?B?clFDWEJ0dkhhV1RXZzA2Mm10TmszVyt1YWtseC83em9NMXJ0ZmM4NjRPaHVS?=
 =?utf-8?B?RjFIcGpjMzJUNU9TZ0NGUEZKMmhuQ3VBOUJuMDFabFhTV01yTmgrOGpaT1Zr?=
 =?utf-8?B?TURiTWRycXVNM1pObWx2R25GVEUydkozWWJuaXJDb2ZUcEY1cGRjeWRwakJF?=
 =?utf-8?B?ZTBDUWpyRkpKZE9qMkhPUUt0NW5QaUpLU3FnTlh6dStZTnhqZW5VcWtnUitw?=
 =?utf-8?B?VW94VGRlZnd2OVEzbWdsYWpmSUdSWEJFQTZ0dVRvRHl5T1BWUEF3Z1FMS2o1?=
 =?utf-8?B?SUpiQXBhSmE1NllXOFJ2WWh4SlRVTDczTW95aUJvRVlEWkFyY09UQUMwc2xH?=
 =?utf-8?B?YXpkRkNUTmZYZUNUWGpuMnNRNGtMamFkRE55c3BlY2lGVEtVYkdIR3U3dHdM?=
 =?utf-8?B?MHRjajV0dVMxb2d6ZlAvc2ZDMU1QOEpwcnk1NVdRWGN1dkRFNVZadFVoOGFK?=
 =?utf-8?B?UVJaZHBsem5UTnpJZ2hjNlhmSlFrUUNsaEJpbzR0ekhQSFRwMDZIcmh3S3dH?=
 =?utf-8?B?K1lKcTFKUzNibFcyNC92bHZVNlpacENsdHA4SVlVNklxUzN3WTlxYXgxd28z?=
 =?utf-8?B?MFNlL0V6TGY4bU1acngwd0pFNHNKYm0vdlRvT1prdFMyZ2JOdzZOZ0dXUnZ4?=
 =?utf-8?B?a0YvbmVGKzhNdkdRdHNYZ1pXdUZ0aFY2TkNmNGdCejlJTFdtM0F2bm5Yamp4?=
 =?utf-8?B?cTk1QzZvZ1lucDN5QlJ0YUQrNldVT2o5TUhxc295V1lsUlZBcHNueDg2OEtT?=
 =?utf-8?B?QmZKQVVaZzlYVzI1eFRoZXdsMDQ2ZS90Z1JkcTBGaTVLYkFYdDJKOC90STdx?=
 =?utf-8?B?SU5EcmwvZW95RGFRL0RjWkdLdGlzUmtJeVNhcGpIRExEZXZTeTVUeFZkc0hz?=
 =?utf-8?B?V0lyOTJUakd5SytDTFdiRTZLSXhyTFMxTUxqNElUK1U4N3F4S0wrYkRWN3hS?=
 =?utf-8?B?anF1QjBUNmFnUXg5VkZldE40UVAzY2o1bHZhUFo4bGc3ZDB4R1dUVTFNZGdF?=
 =?utf-8?B?eS9hM2pJQjZUeWtKUEFXRnAzR2FwZWZja2IxWFVXRm5JeTJLc1ArVkpZbmlC?=
 =?utf-8?B?dHhQL0JTN3pUTk02TjFjN2xrV3lOWlU3b1FYUU4vaHZNK3pRa002KzFSeFdk?=
 =?utf-8?B?TUZocmgvMjlQYzA4R2hQS1hmY1ZWbHE0RlNESGsxbWZ0MXVsaE45NzdjaEhC?=
 =?utf-8?B?MlhidVhYU2ltZ1ozZmhRdkVmZFhkWWpDRm01WHNwVWdRMzFGRXpzcDNzN0ht?=
 =?utf-8?B?K0FjOEFXeEJ4ZUkvalM1TEEwUiszMjMrYVprOXp3WCtRcEo1QjJzdy85SmJ6?=
 =?utf-8?B?RTZjRlRQR1N5cUh2TVc2OXBmNkF5eEp4cnRlTmlRQm9pekU1WXVWb1pXNjk4?=
 =?utf-8?B?aVEvSi9pWmQrRXFBM3VGVVluaXhQYXFFRVplUlg1NkdSWmhoWmxMRmhidXNF?=
 =?utf-8?B?bmZqNTQweWNQS2NsRkJPQ0F4TEdxNzRKd1ozS29mb3ZyZ3RMZ2pqdXNwa1Vm?=
 =?utf-8?B?TTNNQzgzekpTSCtPYWNNTE1SZGdBWEpzL3VZYkNoQWt1NVBSNzZqL21DSzZj?=
 =?utf-8?B?RVBtL0FtNGFPTlhkdjh2NUx0WWV3ZXZJQUdORktud1lEejMxcmppek9XbUxI?=
 =?utf-8?B?ekszWGlHREFXOGpvTURTV3cvSklIVTFaWnBiMVJVdm5OUTJVdktoS3hUR1BM?=
 =?utf-8?B?bW9zOFo3K1p2ODZLSThrU0NQZVNGYXplVThzVGRYMi9GRWJ3ZU5QTWh0TFZv?=
 =?utf-8?Q?gA/OG5GrC0djB/sY=3D?=
X-Exchange-RoutingPolicyChecked: shTPWzMlAI4bK7HJ8eSAhVEzOXZEeQoTMPdIFIf2MIFrdsbfO15ZxXn/MT58ctUwVcW0k+KkrQy0yNWFs1V6uzlx2GBZOOrvj3Zl1aKQMyYTU0xvPATguVqdIYUX1BbroqD5wnQaen5raxwi/U0zZD5VIPJdZyMgtnbVSuH1SAlPqtknsDEFMVuh5gb1VWZ/17AXK3zKu/uH6tP7F+tM+vdLfF760x2GYNBnWDnd39ZOvSp4CkCvBvUar5wiDu9MQnj35moGB9jrXsRMU5j+IfRZNBSNSbP+O9Dv7gz/+l8UVOD1Lw9gvzepq/+v0AYYZ2BfvNqLLEXAB2/SBo1dJQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0f1532-9735-4771-5762-08df3b2b86b2
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB134916.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 10:57:04.0047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30ZKRUW8/lRrUHkhll5NVRdSs8xXG7QpCEwNrEnSv1ahMyK4Dnmue7Lsp7xJb5MIdxNbWnBFIpJywPUIzqfD+sfGQ7stz1EZgBUY0oIA6DQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8422
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Tvrtko,
=20
On Thu Nov 5, 2026 at 11:49 AM CET, Tvrtko Ursulin wrote:
>
> Sorry for the delay, a combination of things..
>
> On 07/10/2026 15:12, David Francis wrote:
>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>=20
>> Add a GPU-agnostic GEM_CHANGE_HANDLE tests. These test for basic
>> functionality, edge cases, and race conditions of this ioctl against
>> itself, gem close, gem create, and prime import and export.
>>=20
>> GEM_CHANGE_HANDLE is currently wired to drm_invalid_op in DRM core. This=
 IGT
>> coverage is a prerequisite for validating the eventual kernel-side ioctl
>> implementation and makes fixing its security bugs safer.
>>=20
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
>> Cc: Christian Konig <christian.koenig@amd.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> Signed-off-by: David Francis <David.Francis@amd.com>
>> ---
There's already a v2. I commented here by accident, sorry for not
correcting it sooner.

--=20
Best regards,
Sebastian

