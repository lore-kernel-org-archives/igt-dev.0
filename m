Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BFA606A69D
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 21:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E3VtfU2Q;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=T+WOK3Ck
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A64310E74A;
	Tue, 24 Nov 2026 21:38:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B3810F0CE
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 21:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795556146; x=1827092146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+l8jtSGq6+9+Rvj0gvWtvHIcUVjf6L/Y+Rt8WUNk1mU=;
 b=E3VtfU2Q9Iz8ANRoxiP3iOd8XUGzmrlyxh2vwo8dvdqg7FlGGiw5Dud1
 hTPbKUkyKY6NlGQJ8l4WIttsbdxjDlFsYgbsE3Wm0PekMwwngCsH1kHC8
 Mi34UDv9u2sWNBgh6HAGfI20a18v3Xlf5dzuP3axcf+Miw6cfWOzlf+zB
 bCKoP6rIaM+6L+juAT+FjFCePYxagq7hZD7Nu4ybp2a+t5tapwEuY+y0Q
 3+EPOmjOYmLr1OMVKvWKa8shjkhnRp4gTBuftQlSRdbyYIjGvpcbTYeXQ
 3X7B0wAGYguRZXzcyIBZI1tUuDVG66kbOs9v+VNkBKBR8dNRMYAZ60zxZ Q==;
X-CSE-ConnectionGUID: x58SQmHcQKO6oKI3Q/pOzQ==
X-CSE-MsgGUID: TgvAakDMQ/aDXjt4q0LSDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4472966"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4472966"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:35:45 -0800
X-CSE-ConnectionGUID: 0yhzyR0YTxqDakKQuUcrrw==
X-CSE-MsgGUID: He6ll4PHSFKhuSeGZ1sQ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11583236"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:35:45 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:35:44 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 13:35:44 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:35:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kamakohjFKV7uMmFpF+/DSmKTueui5UvXaa4T824+dk8vuyMXicWGYLpKVpNUGn3GYkPWznlhwCmx2jr/KBGz/rlOa9/LrARBcGcfJCs9lwy4JWbCWmp1ioVo9WT73XKEyRL4xAGv8nIg16MLqcKTD7YCQFhR1EKXOdw22H0/cpsOJ7nnu0zjtBS8awPpF0JxSL39iT76ZniMzAQuMQRZmPd/yHwC91+/nz7Nn7Dfyp+jGC5aj5eGPI3nl+b1XPbLiugm3nxF0BinmXQ170sbEgwKzNAh0NphDLonH8YOWvBDxfo3i30r+ed9GfVuQW7XM+eYhetgGu7sKtKgxjwZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hulFrDeMHlf1Vyn35lL0+L9vIBuPn5ntkC9RZAHeiV0=;
 b=BTFyruy/BoLUl+/ZYKQsBjxFypEOc/8RTVzlOn+7pN+ZN4spkM26AoAlhYLQshGaiQ+hPGZbz8ir3nWAf1WX1WXi3XzcHNmehu2pDiu5Tb+dpENUl9nXHL3W/Jh0BNH47EaN85rERSexw7SxU0yZ0wPSnrASPkDQZbyJJwMPKRd59MKQWZ1/lnKAK/hKmTzeWX6WXvf7s0+A/OxvykXyKDYkWziqehyZ0tZJosfECr105xzTqqtD8OkODP9FH833oixxQ1WcCJlXf2n/h7WAb9pqB4tKdBqe6zh0EAI5XflDv05N9B1qQKi32J2zDIxBI3MKMf1k3FKK6wswDpgvnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hulFrDeMHlf1Vyn35lL0+L9vIBuPn5ntkC9RZAHeiV0=;
 b=T+WOK3CkM8F5wr/XX1zkB7S/WPDUwNaao3W9xiRBZ6nzxaLJ7cqAs9+frtONxyzWY17NUpmchntB8wA2o4qz/71cukPjUmBVvvS9Agm75IzYC+HSC9kKAWFd6pj0tI405c451QrbNlU0XIcUPt0vkchttzfXYwJwR9YSlhbAeTc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 PH7PR11MB6954.namprd11.prod.outlook.com (2603:10b6:510:205::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Tue, 24 Nov 2026 21:35:42 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 21:35:42 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH i-g-t 3/9] drm-uapi/drm_ras: Sync with kernel c95c93b6e26c
Date: Tue, 24 Nov 2026 16:35:34 -0500
Message-ID: <20261124213532.3674338-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
References: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::25) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|PH7PR11MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: 38b4fd3c-af10-487e-9a46-08df4a72e3e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|6133799003|22082099003|18002099003|261009223027099003|261022105027099003|261022113327099003|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: Zl05fjHKiW2AKjdV4vBWEUMWq1OaMJmVcuEqcupAZFTYT/icqKZfCnn5jxcsgmGTqU+S7wOMJKUtiIQuKt28MHUh7MPntUwTXlxQmf2b8xaJkd3YU54tHmv7emZktPmBXKMv8l0h6+3eOiU1d19K7bhi/nVYImKfyUXHe+MBx0hTnxMzx0GigteE6BJqC0y48yDWxpmdDIKtcv3lg5F8IWaqjWSk0M9STfrqWmwopph3B+sk2w77zI77wBDoeFSvAXBm6Y41/Jc0unS1a3wd7kn8L/H5CjJ+n4OKJBPXZkWw5oCVpuVJBWNv6oHjSi1iFxRvkqln5XnEJDjYQ41RP5ebchEx+pv3hhwKwgmMTGOolGakkcDJAYUwv9YnkQLcf6b5kRpkMqDl3mmD0taqhDWLosmAaPYTS2Lad42KKXW+DBjSXjkc7BU4nwn0UI85BANGftSzCyVN/TXeXFSDRqyPTctJlm+h7fBjIAZiZoMalRIt6HkM1WcOpnRMaNZ9YtS7qac8E/qlG/y8xk7G2rCS74i6WPHFt+eHBKiUNPEPkdeI9QuFSyk5y8AGJYWTg3z5DV6gZu6c98/7acDdov+DnK+7rBZKEhq8ERKQ5Nmu56b+b4fAwCor4qotORTqfkF/fpkze4gP18A9kMquNAnXyURcaVx1HlSUKQ920YA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(261022105027099003)(261022113327099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDVSNzhqQWNrcXpDRGE4UXB1NHMwak40aHFsWmsxRE1iZVd4eDRnbTJqWk82?=
 =?utf-8?B?TEsyZFd2T0d0SVU4bkJuLzlpeC9PeXh0RGNiZEZESkdCeVBSWlpjeURaclkr?=
 =?utf-8?B?WitIUFo2UDBKd1lSUnFTN1d2OGY2Q1o5RCtVYTJYdHBaOW1QeUc5NGVNUzhh?=
 =?utf-8?B?Y3VnUkV6THhRdThaM25nOHFGTS8rWVkvNmlXMkRydEhOZnAxbkRpemZ6K0Zi?=
 =?utf-8?B?Ry9iNi8wV2t1QS9JNGZEOUVzN3huRFdBSTJTZ0g2MDQ4WWFQMXpsUTJaVUho?=
 =?utf-8?B?c05aKy8wZ1Zabk4yeTkxRlJzNkhnUXRERzV0V3dVaXA1OHAxc0pTdVA2R1pH?=
 =?utf-8?B?VzJ5eEZWZ1RiQisrK0N5RWNyU3RpejI3Y0V5MjEwb1JLSUxhcDZLcnV1eFR0?=
 =?utf-8?B?Z1BBUXZtZEVtcTFQb3VLSnAzTW1BcFBqY0poa3ZOT2VZeWFrQk5NaHhYNjlx?=
 =?utf-8?B?UzVsSjE1TkRveXBYWVNxc2FMaEo1ei8zV3VlVC96N1dWM29jRDJzU05ob0J4?=
 =?utf-8?B?LzNuOXJlU1c1RGcvS0xCbkdocWFRQmxweXhhYXRQT2FUeTUxekYxVjZKWndE?=
 =?utf-8?B?a25GRXRPVkRWSDBUMEVSVDZhaTlUdlJYcng2ZklnUW1kaWtxU1BjMjV3cEVm?=
 =?utf-8?B?cHNmZEl0U01xN0VCOFdhMWNyVE83VUMvTGZWQVlCdGpETTNTUElGb2d5MUFI?=
 =?utf-8?B?VllBcHZyTmlvQ2hvbVI2WW1xTGJxSTNoNnZTWU9jakcvL0h6aFVYMlg3Q2Vu?=
 =?utf-8?B?MWdUcnM5RjV4dThKcDIxR3krc3F3ZGRDUkc1bUZGd0d5ZElBcnJrVkVXWDl0?=
 =?utf-8?B?YnpFMWdPeUtJN2RPMEpxQVkzUWRSREEyd1VnTnlMYXRHS2w1YjRPKys1angv?=
 =?utf-8?B?Q0wrSWpvbWcyby9DR3FuNVVwRlQ2ZVhLUW5RZno0K3E0eHBlengva2JvczNm?=
 =?utf-8?B?Z1BHSlFLT3JiT1pvelFxMW8ySWh0bkRsRDJGTkFjT3pqN1JkZmw5SEdxV2Qz?=
 =?utf-8?B?Q1JKQ204cjZTNHRzM2Ird2tjM3d0c2pzN2daN1YvQ05oTTVUYzRQZWMwVVU2?=
 =?utf-8?B?S3hEdEN4U1o3N1lTRkgyMWo5emJGNjRrTlhGWVN6VDlxbHlTc21BTGp5Uks5?=
 =?utf-8?B?d0dzSktpejc2NTEwWExyTVhrZll4ckp5M3hMM3R2SktkV0MzMDJHQ3VNZ3lu?=
 =?utf-8?B?YXJqRVdMT3VNeWV0UzJ0SFA0UnNMdFlHTStxNksrWjdtcEJTQisxNGhuaThQ?=
 =?utf-8?B?WlhseVF2UDMzYy9WaXpKa0NCTlQybEp4Sjh3clplQUU1WnJOOFFYdFlqL2lG?=
 =?utf-8?B?Z3AzOG53QzZRWmV2ZWU0dSt6OWZ1ZitGeTl4emxBTStJbUM1TWVPUTV3ajdn?=
 =?utf-8?B?dEVKbW9iWGFhWXo2S054UmFaUGNkTGladzltR2txdk04eEFZRko1c2NDVFlh?=
 =?utf-8?B?dnJ1YnZuczJrUEQvR1pLNkhEMHp6SnJnZ2grTXM5cHh6ZnI3dGpFVE9tSDAz?=
 =?utf-8?B?b1J3SlRGM3Y5aW83MWVxai9POXAveDlsWkloOTYwL3dEdWZPdlFxY0ZqWURD?=
 =?utf-8?B?ek9TN0hmaUlvVlBZRjc3b21uUndOY09LQ3p2Z1ZmUWpUaUZXSU0yQlFEV3JR?=
 =?utf-8?B?RmlCYTJFSDFmZzN4L2F1aUdHYWEwcHluS09PNnFWdjNyS0svejFVdkxDbk9T?=
 =?utf-8?B?azhuVEdIZnRRSmhOTXdyTWlVMlRVZW1yaWE2ZEhBMGVMaXkyczkwelljdnFE?=
 =?utf-8?B?K2p0alhkWjV2Q3hJMWJraE13Z1U2SU9pWmRzczE0ZENnbThtcXVNZEc1MjBN?=
 =?utf-8?B?b1RBakVRdUVJQVBsZWZlTmRlTmN1ZGlQRGp6Mm9GRzVIY2kyZ3YyUGJwYkJj?=
 =?utf-8?B?cW9zakRySE0rZTJydnQ0OU5Zb3NxWk9JWEdYaGxjbXpFTHczaFJtRlJsR0dS?=
 =?utf-8?B?MVpHZ0c2d2wzZ0MxU1NQNmplbm1Id2krYlNVVEpEb2tYdXQwOWFwWEcwWjRu?=
 =?utf-8?B?cXRjcW1LODNjSGorZHphbGpHdHlYVEorb1pscDBpM3F1eWJKdDZ2bDVHQmxs?=
 =?utf-8?B?QXExRkVvbFYwVmFPNFg4NisyWFh5bklxK1hMMm9ZMDhGRHVmem5lZzU4VG56?=
 =?utf-8?B?OUJRc0xHc3BONi9PNitvZW1jVjB2a1AwVFR0Nis0UmNsYS9xYS9UWnJUSDJw?=
 =?utf-8?B?cU5wSDlWZHJRbDU3alRET3cyTXA5Mk9XQThwbUc1Sk5UNkRqQzV6c2w4d1Bl?=
 =?utf-8?B?NDFOd2h1dlJISG1pNGhGemxsWFhJSFV3ZUFXZVRMejVtelZTaEoxdVZMRzdW?=
 =?utf-8?B?L1ZmS3pnM1BDZkRoVVZ2UGYxWmNab0xOcGxzUy9TOWw3OVB2MGRYdz09?=
X-Exchange-RoutingPolicyChecked: Aqv6rnYTS+SU80vtFDi7UlCGIh8L8fdcqbNwDMDBBtXsJnGZal/Wpn+MNUEnl8psQgZN5poTU3s2LBLBPRHAzi6aFnFsUf1uuc+dlaFKKUTNmiiO3OQynBHXTlI87JXDPIzBtfisGhkdj0pBKvhhTdk3dRJkrHD3yUzXzJZAXplQv8b4hDFmjLk8CLHeQlpbgvrMjcFLfZScytcqjvF4ed66AYhYk7K61qEfO6Er7DLg4079csZNk50W0RqGBT7wjgahq9QAei7IEvtqerA9q1FPDppAtG5fKMyeuE8Ww2KMf/VncINFMM/zC0XVuun+aJgnmI+o16VgpxS2njyggQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b4fd3c-af10-487e-9a46-08df4a72e3e1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 21:35:42.1828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBjabQUr6vFpibLvtx1yFW5aCtP5frcrlBxgS5Cyccvw0w7fmarXXHlPZRGctwH08vlhgmpxg6RE+Em8DNO8oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6954
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Sync drm_ras uapi up to drm-misc-next commit c95c93b6e26c, this will
bring the following change:

c95c93b6e26c ("drm/drm_ras: Extend DRM RAS interface to include
telemetry nodes")

Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/drm_ras.h | 44 ++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
index 54a4cf2e4..56e0588af 100644
--- a/include/drm-uapi/drm_ras.h
+++ b/include/drm-uapi/drm_ras.h
@@ -1,20 +1,31 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2026 Intel Corporation
- */
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/* Do not edit directly, auto-generated from: */
+/*	Documentation/netlink/specs/drm_ras.yaml */
+/* YNL-GEN uapi header */
+/* To regenerate run: tools/net/ynl/ynl-regen.sh */
 
-#ifndef _LINUX_DRM_RAS_H
-#define _LINUX_DRM_RAS_H
+#ifndef _UAPI_LINUX_DRM_RAS_H
+#define _UAPI_LINUX_DRM_RAS_H
 
 #define DRM_RAS_FAMILY_NAME	"drm-ras"
 #define DRM_RAS_FAMILY_VERSION	1
 
 /*
- * Type of the node. Currently, only error-counter nodes are supported, which
- * expose reliability counters for a hardware/software component.
+ * Type of the node. The error-counter nodes expose reliability counters for a
+ * hardware/software component, and telemetry nodes expose an interface for
+ * reading and writing telemetry values to a device.
  */
 enum drm_ras_node_type {
 	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
+	DRM_RAS_NODE_TYPE_TELEMETRY,
+};
+
+/*
+ * Bitmask of access modes supported by a telemetry field.
+ */
+enum drm_ras_telemetry_field_mode {
+	DRM_RAS_TELEMETRY_FIELD_MODE_READ = 1,
+	DRM_RAS_TELEMETRY_FIELD_MODE_WRITE = 2,
 };
 
 enum {
@@ -50,6 +61,18 @@ enum {
 	DRM_RAS_A_ERROR_EVENT_ATTRS_MAX = (__DRM_RAS_A_ERROR_EVENT_ATTRS_MAX - 1)
 };
 
+enum {
+	DRM_RAS_A_TELEMETRY_ATTRS_NODE_ID = 1,
+	DRM_RAS_A_TELEMETRY_ATTRS_FIELD,
+	DRM_RAS_A_TELEMETRY_ATTRS_FIELD_NAME,
+	DRM_RAS_A_TELEMETRY_ATTRS_VALUE,
+	DRM_RAS_A_TELEMETRY_ATTRS_STATUS,
+	DRM_RAS_A_TELEMETRY_ATTRS_MODE,
+
+	__DRM_RAS_A_TELEMETRY_ATTRS_MAX,
+	DRM_RAS_A_TELEMETRY_ATTRS_MAX = (__DRM_RAS_A_TELEMETRY_ATTRS_MAX - 1)
+};
+
 enum {
 	DRM_RAS_CMD_LIST_NODES = 1,
 	DRM_RAS_CMD_GET_ERROR_COUNTER,
@@ -57,6 +80,9 @@ enum {
 	DRM_RAS_CMD_ERROR_EVENT,
 	DRM_RAS_CMD_GET_ERROR_THRESHOLD,
 	DRM_RAS_CMD_SET_ERROR_THRESHOLD,
+	DRM_RAS_CMD_TELEMETRY_GET,
+	DRM_RAS_CMD_TELEMETRY_SET,
+	DRM_RAS_CMD_TELEMETRY_LIST_FIELDS,
 
 	__DRM_RAS_CMD_MAX,
 	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
@@ -64,4 +90,4 @@ enum {
 
 #define DRM_RAS_MCGRP_ERROR_REPORT	"error-report"
 
-#endif /* _LINUX_DRM_RAS_H */
+#endif /* _UAPI_LINUX_DRM_RAS_H */
-- 
2.56.0

