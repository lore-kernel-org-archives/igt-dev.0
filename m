Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA25E9A048
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 14:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CB510E6E6;
	Thu, 19 Feb 2026 14:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="czCIopxd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FB510E6E6
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 14:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771510489; x=1803046489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=G6ENwEHMdjbJkVAjJ0vYhJttv4VOUvrC1N+FfYYOd1s=;
 b=czCIopxdwTA4k6vG0l8RhdX8Kaio17wpA8+4aB7kaxOBZPhEEVBzpWVw
 IgHHLuqLMY5bb7/LtzOux6lhfEHfBFNdf9eJyEPug0pYOVquY48DcXU49
 vko+ClqpwJxfnPcdQHQoZP6SVOXs/+vtJi0Lb3uW/fStm+4XnYrvRcyCT
 Qpwj07mjvzvgDwq44OlQRNxzX3xT3bgQfYxrlVN1WQF/Ua70xSBt1ePmN
 0SPK1+pbzA2ytQJ+XwEmpGu2GbYXRP3p76aDpAj3ZaeHhY3P9vAmthNl8
 +upAaa/D1Q2q82wWd61CpFB8+9uRfUbhSQcV3G/QMFumm6aQVQml7MjYS g==;
X-CSE-ConnectionGUID: /cTC12WCTjeSzonZ1RJZvg==
X-CSE-MsgGUID: wBdrI/bXTV2i5zCmQcDwgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72771638"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="72771638"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 06:14:49 -0800
X-CSE-ConnectionGUID: TZ8UZh7jRhqHQN9D5MWbeQ==
X-CSE-MsgGUID: ltbIyBfsRpCLgGl55sqYgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="245119305"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 06:14:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 06:14:47 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 06:14:47 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.68)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 06:14:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jaulEkQnpLgk2VfAmc6rflXtuQD65zRcLtr+aK0LDbuYiWWSsT8pPj9McH3RwfwqfjSm7x/wE8SfvNJtpXEPHxEP7LePMFjpmidNCDyB5thjuTYab2OcOtOYlZn74bYR08/3jJeFg++Yk0S/+gnHmHjyOTc8Bbfr1SN6F3IZXEHbzbuR8rEmJLq79oCb7IqiQQxUvguSUhZhM2NqY3KOHxSDLRzVJfUMsHb7/o8XP9Zq5IKJTiDL849ZxQqWwcjRtz/DGLRQk+QYfrawZcmnw/r70ffiC8rMFIydLUZiXk0hQ/w44UlIFI+Pm0zEABbwi+zCImu/+8hQEH5N6V2jOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZkfIjYrqYTglXu2J0T1Xt/BVlvDgGl/MLXgpI7d4ow=;
 b=hFTAiPxIQWDuLpPln5nXuX8nMokOAIjg92qrtaFxOKFxKWTTJueK5/y2AzAxVJca/euYSW6Ozk/kDfzV3qN+/oj6+7dlNckcww6Dou2uvgLAeWgG6EIcgJ/VWE5REm23DqvN5HcxHJ0/LKt9MT3sLSo8FpEIWruMFwBkAQK6oEJ/D5SX/PRAjlI8fXwzLjdsAdz3g9QIqqM3uUNlu/blIT+Wz4xz0ooL/vxtg+EoA7OmcvJu4FZfR+zr3Z9qxum5wnB8He5Dfo+9N3d/UQOWg06tRFuLH+zOotCagnOtBo33osRD/Ts8Z/Os9n17RCJbtFEVFjsDAxm7zexflg0LgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA1PR11MB8831.namprd11.prod.outlook.com (2603:10b6:208:597::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 14:14:45 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 14:14:45 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>, "Sebastian
 Brzezinka" <sebastian.brzezinka@intel.com>
Subject: [PATCH v3 i-g-t 1/4] tools/meson: make per-tool dependencies instead
 of using global deps
Date: Thu, 19 Feb 2026 15:14:50 +0100
Message-ID: <014b324e5cb2e5fe00aca8bdb4ee2b03da75668d.1771510028.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1771510028.git.sebastian.brzezinka@intel.com>
References: <cover.1771510028.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|IA1PR11MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a8680e0-8190-42ef-2c07-08de6fc13b71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEtCRmwwVzZQYlJtclRpV0VOSFVjZ28wMjF2OVJyWTBvcDFnd0pzQklRMStB?=
 =?utf-8?B?QThKa0xDK29PS3MrVTBrZDN5djQzUEJaVzVsd1FPM1VrNGtadVlqOENiTG5j?=
 =?utf-8?B?TnZlc0l3THFGNk9GMUVBcHZLRE14RmVUY2tJYnJQdzdyMHV6UDV0d2ZyMFlL?=
 =?utf-8?B?elJHMDB0Qit4dFk2blRHRW5nWmhXRnk0Q2t3ZDcxQ05FeVRFa2NyZDNleUJ2?=
 =?utf-8?B?SnhCUVBiSlhWa2cyME9BR3JSRzNLd05od0YvOHEvMU1pdnVkUTJnVFhSZkkr?=
 =?utf-8?B?K2FGOEhTeFNLMm9HOW1UYitqb2VDU1owTTBqbndINnZldjUvMkliamZyV2kx?=
 =?utf-8?B?T25UNXBCSFozK1lreGxCOGN2NUZRaFBZUGx6VDlSY1h3Unk3eHpzTUpPQ1dV?=
 =?utf-8?B?ZTdxb2hLRnNqbzgyMGI2cWZtUmlydXA0Sitrc1I5OFNabS91Y3dFRVB3eHBT?=
 =?utf-8?B?aG9GaVRaaXV1YUFvRW1aNFFtMWFaeXdRMzlVeWFFV0lkVHhROUk4N0d1aVFr?=
 =?utf-8?B?TlBRMFN6S2o0SEl6T1RmU3BOZk1lbWFSdVZ1bGgreTI3eHgvMmFNd3ppYzVp?=
 =?utf-8?B?V1o3N3BSZ2h6WG9BNVhNS1I3V2N3MU15Nm1mMjZta0tidFhzWS9KbE4xejM5?=
 =?utf-8?B?L1hNalh0U3MrY1BKMVRTTi8zenBENkEvcEdrbWZuL2pxVXQzWThhRWtLb2hs?=
 =?utf-8?B?dC9yQ1dWVXgwSFE4cjkxYlZoSnlzM2h1OElOSDQvVE5qVXlzNTA2MHdmaDlu?=
 =?utf-8?B?WW4xM3RYd0xBOUFqcmVqRlVwVWZpaVFkZzR5YlNVcWh1WUlMRk02ZEVtUUhV?=
 =?utf-8?B?NXIyRGhtMGRRM3FSUE45MGJ1RTRtUXpUdW9Mb09nTEdiRXY2dkhYVDkvRGQr?=
 =?utf-8?B?c3Iyc2ZDZGM1dUVpSjVreHhyRC9yYm5uYTd2R2hOQmNFVXFBMVNsc3VGdjY0?=
 =?utf-8?B?RGd0OXBzQ1VQSWliSTg4amlMR0NMREFla2lSc2xGcGN2TDk3cmR2ZWtvWnZo?=
 =?utf-8?B?Nk1xeVczalR0eUI0dlQvZm5vQVZWUGd1ZFRmamZrR0tYUFVpOXpNUmwzTndy?=
 =?utf-8?B?dFl2c3Q0bCtQdjRLNC9zUlBkT3h3Q1E2Y29NVWF3OVd5dDkyRkF2ZUZjbUM2?=
 =?utf-8?B?eEFadXJnWFpWb0xvdmNNV1h0ZDB3Y1JsTjBpR2JYZ1liY3BhWW9POTh6bUNo?=
 =?utf-8?B?U3lkd0xUVVQzL01NbmtrUitYbDBJYmUvQ3dTcW9QVys2QTVYcEs4WndrdGR5?=
 =?utf-8?B?QmxNNlhhZ1pIRU4wcEZkNUhnR1VQajVyMVFQNTBEa3hvbXZrUXJPTzRXL0xD?=
 =?utf-8?B?dlR4ZkxuNDBxVnFOU3JjN2QxZ3FLQ3ZNb1Jkb2tCdUsrQXozRzcrUTVtRXA3?=
 =?utf-8?B?VGNLUVVEN0tyU3Q1djBhZm13OXhFK1pic00vMUp4dzhKc2M0bEU1Z2xQcG5l?=
 =?utf-8?B?aUJJcXlhNUZVcFlzMitJQ294azM4S3lqaUtlOHFDSjFsWThWcjBCeU45SnVI?=
 =?utf-8?B?d1BpcUMyYTRlMmR1cmJtS3d1M056Y0FyN0czUCtHNHhVVEVxWXNXSnhMNzB3?=
 =?utf-8?B?MjRXdEdkN3ZtUnhmVmtZb09mcTJJYjBHZnh2Zy90Y1E0d3p1MFNQL1EreFA5?=
 =?utf-8?B?TksySzJQNERXUlN6RGFRSW1lcWJEOStMQ2RwbUxsbUd5YUQ1cVlvUThDc0xy?=
 =?utf-8?B?UFAyT2pXa2I4eTVVWUhCcmx4eXIwN3k5NDVlZjdYTDhJeDIxWmFKeVRmT1hT?=
 =?utf-8?B?YTEvODFPNDMvSVB5c1ZOYW9JdjVPTUdIZlhHMWl2dXFxSVgvWjFKU1VQeEIv?=
 =?utf-8?B?MU5ORDVscDB5V3JtS0NsZjRBOU9ueFRtT2RXalZjQTd4RUNiLzlwbjhuUVBX?=
 =?utf-8?B?dC9hOVRzT21zRFVZdldzbm9TQVdZU2s2NWw0QnJkMTVXVzhTcFlkbEVBM01L?=
 =?utf-8?B?NFppTVdqZHM5ZTBkSkFHL2lDVnBTS09oSXhmU0dQQTh2K1R3b0d5WGwzU011?=
 =?utf-8?B?UnFWTDBoM0ZxVmtLSmp3amlLM2FDR1QrNEh2bkVBZjdLcmRKdkt3b1lOUnJJ?=
 =?utf-8?B?bTRHV2c2bUU2WmlRN2RwZnhHVDdHQlZmSXRmU1EvdnRMbFVMYmgxbFAyZHdv?=
 =?utf-8?Q?PRag=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnFGcHMrVzJnOUNGUEw2UDZMNjFIOWUyS1BaTUhhY3VGczhuZVBBRWg1c3BR?=
 =?utf-8?B?N0Y2VVA5ejZsNGlaaGN3ejQvMHhtWE1DMjVVdnB6MDVUeTU0SVdqVmU4SmRn?=
 =?utf-8?B?MEpTRTYzSUtzNVNzaE9ZNlpTTWlSalkvdDRTK3RmK3NGSkhmaHVmemVlQlJz?=
 =?utf-8?B?SFJYZjY5QVdjNlZFZmljeXl2MittcW5XOTlwN0hHemp0djFJS3RuVjN5ZkZh?=
 =?utf-8?B?SnQ0aDNoY0Q5UlhuRUMwdjJ3V1lERTQrZm5LNHhQWXNHcFp2S0tIekQ4Zm9y?=
 =?utf-8?B?NXpBTXZ0S2NEYlAycVBGK3lVdXVRZXVZOXMxWEt1dDNmanBUZWpTaEJVUVMy?=
 =?utf-8?B?K2lIZ0hIWUtsRHZrb2lDMGhFckJCUDlpai9reVI1dGhFNE5LeUlDVGhaZ0FK?=
 =?utf-8?B?dFBWaUdXY3JVYWl2ZnhZR1k3THltL0Y3WGNYUlN2WmlmRFJpSmp4SFJIdlhJ?=
 =?utf-8?B?akpsQ2tubjdpdzhxdmxzc2t4V1FFdDZEOEp0eVBDZmtCTXpEUkNrWW1SR1ZJ?=
 =?utf-8?B?blRndGd4Z0craXJVam14bHhXZE0xS3pZVWcwRkhadHNtQzkvOWltazdHUldi?=
 =?utf-8?B?ZDVUQUNNcU5aeW1uaUZVOTA2YlRhdDJtUTZIQ3FwY3MraTJuNjRuaXN2UGsz?=
 =?utf-8?B?NktHbjZ4WWJxaU83WXMzaldpdlU2SWF3ampwa0ppdS9pYm9WcFIzRnNRb214?=
 =?utf-8?B?a085RUdnak5ka29wc2NRS2RjS0wwb2ZFTm0zaXVZNGpNRTN3OXZ1NTZyUWxq?=
 =?utf-8?B?aDJFRm1zVjVLeWdjTk5kSHVaSXd2RVlpL2lTV2ltQlN4TzdpVGFZaVlQV29R?=
 =?utf-8?B?dXozTktQaEVxMm9ES2QxTG8xU1hmaFU2KzhmM1dVQlh3aHBHaXMyMlppNis5?=
 =?utf-8?B?VHpUMWRjNWtNQmtLZWFhRm4xVlVsQ0pqL0dINFlvUmNOa3FLVFlERGFOTTRU?=
 =?utf-8?B?VjZIdVl4ZVEwWm9FMVJHZHpVeHpNQnZXV3c2RzlmWUtmRXdXNmFZOVJzb3VX?=
 =?utf-8?B?VW03bnIzSmpBSGlNZFdPS2pLZHFraGZpTmdVZkE4SmhNdlR1TC8xVmk0clhk?=
 =?utf-8?B?S1VNdjlnWi91czZoNmFROEcrcmpmamhWM1hmKy9PVWRHTGRYZlh0R0tMYi9H?=
 =?utf-8?B?UGNOQU9NZ3BpVGFRaDVyc2JnanRyTVhYQy96VDJ6RWsvZGlxcmhKMGl6TWtG?=
 =?utf-8?B?TlAzUU5WYTRRdXpmWmRTMnVubk9JWS9ZWEt4ZWRmQ0lDQnFaczNFVTRKejRN?=
 =?utf-8?B?bGw1bXZ5VjlHdWU5RVlWV2k0ZHM5Vk1lOFk1czMrUUFGdHYwQ3ZuRmNLOUF3?=
 =?utf-8?B?RWExQWpVVFB2dXlpMXNQc0NzcWRQZlg1dGR4ZVBJcW9qZ0JrT3JuajNmb1Na?=
 =?utf-8?B?WUFHcDA4Sk85OCtRNW1zTXFzeS9zUW9VcFhkKzFXdmRoZDNNNW03b3VRMXFQ?=
 =?utf-8?B?YkQ5anlzbWk0aytSS3czVktrUVN5WGZNaUFPcUhDSjdDb0swZWVUNTA3OVMw?=
 =?utf-8?B?UVMzYXNOaldmb1M3SU9yUGxkRFNCN2tHT0ZWamRuOG5NR0wvdnBZYzJWcDE5?=
 =?utf-8?B?UFdXUjl6Z0EwS1FqT2VReHVtUWFTa1RGclNQcER6TE01SFplQUg0ZkZxU0c4?=
 =?utf-8?B?MGl5Y1BMYThHbDJRMmFxamt4WWl5dmt6VTVrZ0l0eC9Gb1ZKdXBJS3psemY3?=
 =?utf-8?B?aWV3aXBuUnd0MStGcmd6SFMxQm5MTjFXYjFkd2tyNjJiTFBpdm5STC9vZUJv?=
 =?utf-8?B?OTlNNFpCdjI4RWt5SjNSQ3hCSVczTFV3Sk1peURoYkx5eDdBM0dkZllMclVL?=
 =?utf-8?B?QlpOOFN3MytBRE4wNXlVWm01Q0dLcFJ0aVRubXlFSXVrNXM0eURUdUpmRS9F?=
 =?utf-8?B?TWgvTUhuYVMrcGlFbWNCQkt2TlNNVzZnN0FUUHhEYUcvT25vNHltZFBZVDJJ?=
 =?utf-8?B?R3p4cmw1RUE4alFuWG9Sb1l1RzRnTVFpRS9LMU1qOHo4QmIwcUJmb0M5UTFh?=
 =?utf-8?B?SUFMNUEwaG9VT0wyWDk3aGVQNjFuWTIxSkhyVk9uK2p1ZWxESlNxM055Qi9K?=
 =?utf-8?B?cDk5Qk9TVy90NHJPd3ZyclpOR1NFT1hTSDZHTlg5VXpxNkpCUktkNzE0Zkh4?=
 =?utf-8?B?V244emdZeFVZbFprY285MEdLQ2pNWVJsM0xWaXhiUXd5cjJZcHBrdXJhY3VI?=
 =?utf-8?B?aDdEblMvWFQyK1psRG12MTQxVXJnTG1HRXNaWitKdGZCamFBTzRaclk1eHlW?=
 =?utf-8?B?dHA4OTJpUUtYTWxDVWRKcVFSekQ0MTgvS3ExazhDRWZZR2Vzc1pOK2ZSMmNa?=
 =?utf-8?B?cXBqeEJ4Y2dtNTNnR2xFRnJBakRuYzAxbDNlbkRvMWxBQnAxdG5JWE51ZDc5?=
 =?utf-8?Q?SZbP3hq1+A/GogsA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8680e0-8190-42ef-2c07-08de6fc13b71
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 14:14:45.2025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q11wIKdoSQJvPgCkhzXSU9B6w80mEzzX0DR7irFqWVMXS4MhLX0BMJWJVSwAQOf39VF0l8FNvQNCr2ePPAbSkBE3Z2DXd4A4CnOmCd/C4Os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8831
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

Rework tools/meson.build to stop linking every tool against the full
global igt_deps set. Most tools do not require cairo, glib, udev,
pciaccess, or zlib, and the previous all‑tools‑get‑everything approach
pulled in unnecessary libraries.

Introduce a small shared base dependency set (lib_igt, libdrm) and
switch to a per‑tool dependency dictionary. Tools now declare their
actual extra requirements explicitly, reducing over‑linking and making
dependency intent clearer.

Fold previously standalone tool definitions into the unified tools_progs
structure and use consistent executable() creation. The tools list is
also reordered to keep it clean and logically grouped.

This is a build‑system cleanup only; no functional behavior changes.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/meson.build | 121 ++++++++++++++++++++++------------------------
 1 file changed, 57 insertions(+), 64 deletions(-)

diff --git a/tools/meson.build b/tools/meson.build
index 8185ba160..0fc2427f9 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -11,51 +11,60 @@ foreach prog : tools_progs_noisnt
 			install : false)
 endforeach
 
-tools_progs = [
-	'igt_facts',
-	'igt_power',
-	'igt_stats',
-	'intel_audio_dump',
-	'intel_backlight',
-	'intel_bios_dumper',
-	'intel_display_bandwidth',
-	'intel_display_crc',
-	'intel_display_poller',
-	'intel_dump_decode',
-	'intel_error_decode',
-	'intel_forcewaked',
-	'intel_gpu_frequency',
-	'intel_firmware_decode',
-	'intel_framebuffer_dump',
-	'intel_gpu_time',
-	'intel_gtt',
-	'intel_guc_logger',
-	'intel_hdcp',
-	'intel_infoframes',
-	'intel_lid',
-	'intel_opregion_decode',
-	'intel_panel_fitter',
-	'intel_perf_counters',
-	'intel_pm_rpm',
-	'intel_reg_checker',
-	'intel_residency',
-	'intel_stepping',
-	'intel_tiling_detect',
-	'intel_vbt_decode',
-	'intel_watermark',
-	'intel_gem_info',
-	'intel_gvtg_test',
-	'dpcd_reg',
-	'lsgpu',
-]
-tool_deps = igt_deps
-tool_deps += zlib
+tool_deps = [lib_igt, libdrm]
+tools_progs = {
+	'amd_hdmi_compliance': [tool_deps, cairo],
+	'dpcd_reg': [tool_deps],
+	'gputop': [lib_igt_drm_clients,
+		   lib_igt_drm_fdinfo,
+		   lib_igt_profiling,
+		   math],
+	'igt_facts': [tool_deps, cairo],
+	'igt_power': [tool_deps],
+	'igt_stats': [tool_deps],
+	'intel_audio_dump': [tool_deps],
+	'intel_backlight': [tool_deps],
+	'intel_bios_dumper': [tool_deps, pciaccess],
+	'intel_display_bandwidth': [tool_deps],
+	'intel_display_crc': [tool_deps, cairo],
+	'intel_display_poller': [tool_deps],
+	'intel_dump_decode': [tool_deps],
+	'intel_error_decode': [tool_deps, zlib],
+	'intel_firmware_decode': [tool_deps],
+	'intel_forcewaked': [tool_deps],
+	'intel_framebuffer_dump': [tool_deps, cairo],
+	'intel_gem_info': [tool_deps, cairo],
+	'intel_gpu_frequency': [tool_deps],
+	'intel_gpu_time': [tool_deps],
+	'intel_gpu_top': [lib_igt_perf,
+			  lib_igt_device_scan,
+			  lib_igt_drm_clients,
+			  lib_igt_drm_fdinfo,
+			  math],
+	'intel_gtt': [tool_deps, pciaccess],
+	'intel_guc_logger': [tool_deps, cairo, pthreads],
+	'intel_gvtg_test': [tool_deps, cairo],
+	'intel_hdcp': [tool_deps, cairo, pthreads],
+	'intel_infoframes': [tool_deps],
+	'intel_lid': [tool_deps],
+	'intel_opregion_decode': [tool_deps],
+	'intel_panel_fitter': [tool_deps],
+	'intel_perf_counters': [tool_deps],
+	'intel_pm_rpm': [tool_deps, glib, cairo],
+	'intel_reg_checker': [tool_deps],
+	'intel_residency': [tool_deps, cairo],
+	'intel_stepping': [tool_deps, pciaccess],
+	'intel_tiling_detect': [tool_deps, cairo],
+	'intel_vbt_decode': [tool_deps],
+	'intel_watermark': [tool_deps],
+	'lsgpu': [tool_deps, libudev, glib, cairo],
+}
 
-foreach prog : tools_progs
-	executable(prog, prog + '.c',
-		   dependencies : tool_deps,
-		   install_rpath : bindir_rpathdir,
-		   install : true)
+foreach prog, deps : tools_progs
+	executable( prog, prog + '.c',
+		    dependencies: deps,
+		    install_rpath: bindir_rpathdir,
+		    install: true)
 endforeach
 
 if libudev.found()
@@ -65,25 +74,19 @@ if libudev.found()
 		'igt_compliance_utils.c'
 	]
 	executable('intel_dp_compliance', sources : intel_dp_compliance_src,
-		   dependencies : [tool_deps, libudev],
+		   dependencies : [tool_deps, libudev, glib, cairo],
 		   install_rpath : bindir_rpathdir,
 		   install : true)
 endif
-
-executable('gputop', 'gputop.c',
-           install : true,
-           install_rpath : bindir_rpathdir,
-           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
-
 intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
 executable('intel_l3_parity', sources : intel_l3_parity_src,
-	   dependencies : tool_deps,
+	   dependencies : [tool_deps, libudev],
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
 intel_reg_src = [ 'intel_reg.c', 'intel_reg_decode.c', 'intel_reg_spec.c' ]
 executable('intel_reg', sources : intel_reg_src,
-	   dependencies : tool_deps,
+	   dependencies : [tool_deps, pciaccess, cairo],
 	   install : true,
 	   install_rpath : bindir_rpathdir,
 	   c_args : [
@@ -94,16 +97,6 @@ install_data(['intel_gpu_abrt', 'intel-gfx-fw-info'], install_dir : bindir)
 
 install_subdir('registers', install_dir : datadir)
 
-executable('intel_gpu_top', 'intel_gpu_top.c',
-	   install : true,
-	   install_rpath : bindir_rpathdir,
-	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
-
-executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
-	   dependencies : [tool_deps],
-	   install_rpath : bindir_rpathdir,
-	   install : true)
-
 if libudev.found()
 	msm_dp_compliance_src = [
 		'msm_dp_compliance.c',
@@ -111,7 +104,7 @@ if libudev.found()
 		'igt_compliance_utils.c'
 	]
 	executable('msm_dp_compliance', sources : msm_dp_compliance_src,
-			dependencies : [tool_deps, libudev],
+			dependencies : [tool_deps, libudev, cairo, glib],
 			install_rpath : bindir_rpathdir,
 			install : true)
 endif
-- 
2.52.0

