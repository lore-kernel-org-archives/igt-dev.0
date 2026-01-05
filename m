Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C865C2A075
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 08:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B817910E05E;
	Mon,  5 Jan 2026 08:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdDFG4gH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF23B10E05E
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 08:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767602754; x=1799138754;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GRG+/F2IgtgyXqDeh3YJfOONk/JeCqqj3/f8YNKwKqw=;
 b=IdDFG4gH4a7IAbZpeV5caKo83azDVa1wpG8B/R+jo44unlTNY3Fb4nPn
 FcJb8q89EtaxiUMFDQ5Tgle9TeAaZFj2n8T2ofW9YerGYGoJUM1KcISXQ
 1mr1OofI8othjWCrZR6xwPNP8s9x2MN+KH3qBBbTjcql9kSBfnjRwtHwR
 M6PiNEeWlxndj0deVXDFXT0YDZ7IkZ7JtjjOxewOZ7VnVuiKGaFHq+Ru5
 JnkXTgwpCySjjdhffBFV9lSSwf/MPuxjJV/qXavipTld/yNf2cnPqRLPI
 0/rI/0ZBWHo/qcRV12IhYE94I8UNyHFAZZdCjns+4n3nG9NiOk/Um5f4V g==;
X-CSE-ConnectionGUID: goANHCn8RVqKgrj4rM3j5A==
X-CSE-MsgGUID: +uwrWit+T+CDw3tilYwPqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="72825467"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="72825467"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:45:53 -0800
X-CSE-ConnectionGUID: bbuRNPLSSKyJ+fQmJyN1hw==
X-CSE-MsgGUID: 5S030J8xS2ymdQRH8od8xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="206490782"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:45:53 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 00:45:52 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 00:45:52 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 00:45:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmhqp22kraM2hL0UEZdgdTkc/7SVUNtqVYhz/3hHUX4vIOp4PBo7fN61jFSM0yQO1y2VVoa9vEq9S+RTMULnhU9194RGiH+rx7o7vxAG9waZG/zG3hJ5pGx084YybH9lS1NZmIU7Ihw38DHa7cWSifK0+z/+JDLU5cpBx2JfJ7fkX+YE1y66Yg4tXAr8SFUNmb3Utw8+TYrna+qf2KLFvocGmvXaLPFIMKIsXgx2Bz6UY0VlFwRoNfhY0tplzTTmW0ybW0V8pgrQPgmVXdGf9sdwzS9HJ0lSgwlrJu6jIXHlClEuAWrbbyDvut58emTWJpq5+igdNjQ0TXhb+c/JPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0Me+nBXuAxRAhCp2qV3bY6lje2tsiXz74EOOWg65uw=;
 b=lb3jgn4LtvBswg6L8W75kZWsiW/soqRrvhbipWjEZQEIDWyNx8CLaPtIgeIF6e/Z+mqA8ksZcWRzVvPS5BMGZsPiT7epALFTgHH8namXNwBkmEanS43K/x5zqWaeZOs+TYtEXwtMWLrR33WOKdKJ/ebIlDBVNcWv9RKhQSznyQ2/kFirMsSjHOaCGnVal7BstHSNqi6EDQ3YbhFWvegS5ill3zthDno4pvuEoT1QLTWmeDbv78f47/XnhjzlQFcnyqXslfryYfJcaMWEkeHuv7PMQnRrpgVfUjnThO/GiAlpYbuK/UBDYNgJJvfLOrDu4N1VLOGy/icUHTtgIUo5ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SN7PR11MB6970.namprd11.prod.outlook.com (2603:10b6:806:2aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 08:45:48 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 08:45:48 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t 6/7] intel-ci: Add NVL display blocklist
Thread-Topic: [PATCH i-g-t 6/7] intel-ci: Add NVL display blocklist
Thread-Index: AQHcbrw1YSTliEuFzEWcxm5FVpG437VDYamA
Date: Mon, 5 Jan 2026 08:45:48 +0000
Message-ID: <DM4PR11MB63124A273FC534B806D52E4D9086A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251216185215.1281390-1-swati2.sharma@intel.com>
 <20251216185215.1281390-7-swati2.sharma@intel.com>
In-Reply-To: <20251216185215.1281390-7-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SN7PR11MB6970:EE_
x-ms-office365-filtering-correlation-id: 14ac8b2c-8db7-4d43-4330-08de4c36d308
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?h34aVJ9pcxSzAayZ77OkXS3pM5+NDoITBbxsZfGiI4hMDAJ3ab6dz7en5M8l?=
 =?us-ascii?Q?/llcLN+zMg/j2Z1/gcDG2VNykfmtYrPwcbimc84nCvHIMCzcHFpHTZGjY8Lo?=
 =?us-ascii?Q?l7T8j1phZzvUknC4jSWFibpGKVDuCQM/8BPuI/2aqeXY9nQNUpxVsaINmlvl?=
 =?us-ascii?Q?ZYQfMbIzScSus1upv6nxW6R7Bj5CtS2e654ugHEZbkDe1wxiBN7kK9AAARZA?=
 =?us-ascii?Q?eJ11GCaga6W0O9Ht9aDO5eVMDf9bwacPjq7t3/fNkQBop6bkX876fBIfBxs5?=
 =?us-ascii?Q?eDI0ffsLMv8KCPuuLjyMveBLpNpuDx3ueqUquO4L/Xj+6qHvVIuUwm2gTXSx?=
 =?us-ascii?Q?Ls4o68Wt1PEvIgJsy1IvU4+LH2Jhm/dxOwP4he042EPjCwoeTx8KnvHQuWJu?=
 =?us-ascii?Q?RHJlSYdVGTQmQ6MYpFpjyjiHQpefpRSEAJtHBkrlDRNiOP331nTfws/Ofdjb?=
 =?us-ascii?Q?Mce9nj8ax3qh9hvJZSu8EIsw9xd2ZTZyGNwNxH6ZvykpeeshnWRCxmfGImes?=
 =?us-ascii?Q?cXwbROZwfyIqcelxf3rT7quWB4ucWOZ55gAkC5MlTmCkjnygm7/ErEZpFLlo?=
 =?us-ascii?Q?zWUQhzSJw1+kY/URx/rgB7hVzVVJOgx0UDw4UyPMqbS1oXysKaQO0gUaJeRK?=
 =?us-ascii?Q?zB6YcXp3np73566I+3mJi8cI4RIIaE6UPIpov9WCnk6I3lEXW9XLJDsRFEca?=
 =?us-ascii?Q?OcITl8vfIOrBdNX4Udvfn+GjE0yJytN3Y+ER7NSJpk21xE4vKv4OvJLtZhVO?=
 =?us-ascii?Q?PtNkhmHduYjBXSPJttM4GndKLzhUPgA+f5w4sNTBLf6VzExgF8AYICb/YTac?=
 =?us-ascii?Q?uYyBKONovGtaggcLQsXzo3xMxB+1vaDaJQ+7x4yTnDnw//Vj3fonBQ0iFqJ5?=
 =?us-ascii?Q?1DCnLJN6blYX7Cdx7LKP11xwsHzioi1AycQ1U93rjGIM5irWlvNzGF7oKVGS?=
 =?us-ascii?Q?CQhjzCPhbvCx7jC6SZDZrtFkQ0PhOb74ZhETcVTNjmiIKCH7TjLVHyvXKZnr?=
 =?us-ascii?Q?GlryKYw9KB7tBbYqr949GPWb0wZGNyp/9yn4VFANF5c3qxZLavY589ma/Zl4?=
 =?us-ascii?Q?JBkZ/TtLequAID5hJr0raPRb6jZTH73LnFuylAC5oTxDVRP/RVfyhzxMc6qV?=
 =?us-ascii?Q?fy22uXVrfOCsPLXNbO0fCwLfTIvMSbeL69dPBrmwSNNu0lD4BaBhDIeWvG2t?=
 =?us-ascii?Q?1QIQhNHW/zWo2sZyuEYtue5tzH0EVZk8Krg0r3zvbYBuB0lvq92TBYJ1Z1Nb?=
 =?us-ascii?Q?nZJmZI0LNXq/5TW8w93z5k1Ty7HO3PSX2WslgKOoD5ueYjkPcWMzkQ1GHEu0?=
 =?us-ascii?Q?o+KacixtEkgmksob+3m9Ogh4Ti6dZJClTxDlQFFwgT3vBQwwzMk+wvvGGZ2r?=
 =?us-ascii?Q?6dHamqf5Z5NL+6ykI+M4DiklF3FtzBrBByVnm1kZWo47Wl3pWWpgPYwnvsjZ?=
 =?us-ascii?Q?y7zpHcvKKlVMxxRfF3yKm4nux5SL9qtZgVXb4wFIuJmc+O4asa9X5ZtFz3dU?=
 =?us-ascii?Q?ZjCYkFjP5kyBHxF9PrtvZro3/2ZHgz0ENSbu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V/jLExUBOxBh6pXxjoCCsrjPd+yWZLU5AA+0/sB1FTSBMDhEAFjJ7k8yYvui?=
 =?us-ascii?Q?HGezeAT5dCcjR2T+Ls5I0oZcd+zyTauAlCJdyGCosKBbZn+ji38qJYsZFv9K?=
 =?us-ascii?Q?+itccQPYf6JZOaKxxpHU7eVVgwUonJYXlBncCwNeHFtCig15WiNh8Rx15pWS?=
 =?us-ascii?Q?mI9FnWjoNrUij/myz7ksOrlrQH/0mCtF2+TTlVaQjOVmPiXHQ/rJoQqjvi/y?=
 =?us-ascii?Q?3TcRigkl9QG3tb4tHaqQ8cWFocfOTLDZB8rFufMxIlWRQqz/d5q2O6E7RVx3?=
 =?us-ascii?Q?ZE4tKb830f3qE29cdHfp6eD9LpU9l0928LFSJUyfrUsDbuG9c5WoxWTXx6JN?=
 =?us-ascii?Q?cIfuW8tPCFl7Ad2uykZYwYmF7glb9/G97m/rv19rLIEe0Mvg62u4d4aHLYc8?=
 =?us-ascii?Q?qmvyOyshPJN8KwYA8YvnTZAw5YYP7XumAaMrJp47PI7wQPCWN7YTDMqhKxqC?=
 =?us-ascii?Q?0Mc9RFMKez1+u9WcQXHwlqYG9qq3auPxctVHj5V15S7I+VrxXckqJusrlykW?=
 =?us-ascii?Q?LlF0pTLKYZF6svHA/AFobUDnoE9c8EvQFiboBmcUho9SClsjf0/ZNN6KhBJB?=
 =?us-ascii?Q?QMg0RDUpWULA0DVcuVq9XnAZ/FHQRath8cU6d7uvFWQXyE8M9sZeXAhvIjhb?=
 =?us-ascii?Q?33AvU/rR6fcK14ymNemDwz512cd8SeSG5Q/+FAEW1Me/vzrPm0W5S8wDM2Dj?=
 =?us-ascii?Q?HFRnHkhCEIEVxiC6gKKTy2E5NxBPghL4HMLi46kwr9vDvoGEchlTM9sB6aoV?=
 =?us-ascii?Q?quQPd9u7yEaxDkJ+aPq6gciHJKtuXp2eAci1GmwRcUIwlL3rf05wdLaYYto7?=
 =?us-ascii?Q?qGBrWhCzDclVWwZvB8TLxFLPA6YVnjkYOsjKn3zG2bPRZhonNAoWtrBNjEDT?=
 =?us-ascii?Q?bbRIit81Ek/2wexqb+/cn+Dyn1ORewr88mss2polgMgrmvUufLc6W6OaoKM4?=
 =?us-ascii?Q?xuHliMunfx+MTX9K1sIuQ/seanZIqBoNMb+8QfmKg0dLco0rS2TkljfwcfCc?=
 =?us-ascii?Q?Nq+dxHTU7JYyIaxX/ikgBvxfy4UjLDJK7qsUkZVK/nYL2G2L1F/NBS7ibY/c?=
 =?us-ascii?Q?uYqg/WN82z39kVAjinuYv2cSYbdZjr3hGzq83sdp5RLjkVlS61HYit3B/w2L?=
 =?us-ascii?Q?AsOD0vecXi30W8ND5DQE4YC6iEFgbQDO7UosrB1L9BaDrTEtgGxRM1gmSIvz?=
 =?us-ascii?Q?VUhRUxq7LHA3IbslmwVbEHhH4V84E46Jo6lg5tfKUkF4CoRGBN0vgxaBQ+ON?=
 =?us-ascii?Q?ST7GW+CdQSiMHttrSOpb1nvZSbgpFloeJHkjR0xV3kohgYM1B+U3ib+Yige6?=
 =?us-ascii?Q?qQBDemCXxMnt3ZgSPC4vE23SrzRBG7fZFnfRz5N/W34iLgSPH8JeEq4Kcv0P?=
 =?us-ascii?Q?40XjtaPKmJICyyZmNS67mAdJZ5jt2evFbWRrsox6q0+B0wOyNWeEXeWHerDX?=
 =?us-ascii?Q?Wy2KtvzLJ7YD+uhJEqkQzmna4S1uIp1aw5UPq0egRBot6nY1qWJ0lz4p68iz?=
 =?us-ascii?Q?zhnhFySg8OJ+gIL0H9Iq382NZAF0id6r04tECvB2G6T2ufxZwPC0IylOG9Oh?=
 =?us-ascii?Q?YlEsgb/mzI++8A9Lk9pdB+VfC7u6S8ELF02qEIoNdEvgGkEBahWIeSwwlj89?=
 =?us-ascii?Q?lAQbWcE/7wMJbzetxUyZWcjR9LjUKP5j+atfJShSxBqRzNoJuP40LDsp+ddw?=
 =?us-ascii?Q?zvRjyPgYVfzsz+yAI1tvcAxTzNrA4SRceqQAAWonZfCwuxMQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ac8b2c-8db7-4d43-4330-08de4c36d308
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 08:45:48.5038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bGkkfxizuUnUbndR+w1pC8RHAfvmF3wcdvanjR+y9VUdUiPoX4lAJHxH3QL7kzlubJOpU8YyphB4jPnbWHyUkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6970
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

Add this test also :=20

#########################################
# Valid Skip : Not supported on igfx
#########################################
igt@kms_pm_rpm@package-g7
#########################################

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Wednesday, December 17, 2025 12:22 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t 6/7] intel-ci: Add NVL display blocklist
>=20
> Introduce display blocklist for the NVL platform containing NVL-specific =
display
> test exclusions.
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel-ci/xe.nvl.display.blocklist.txt | 128 ++++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 tests/intel-ci/xe.nvl.display.blocklist.txt
>=20
> diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-
> ci/xe.nvl.display.blocklist.txt
> new file mode 100644
> index 000000000..38ca3a654
> --- /dev/null
> +++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
> @@ -0,0 +1,128 @@
> +################################################################
> #######
> +#######
> +# non-KMS tests
> +################################################################
> #######
> +#######
> +igt@(?!.*kms|testdisplay|.*display-vs-wb-transient|fbdev)(.*)
> +################################################################
> #######
> +####### # Valid skip: Y and Yf-Tiling not supported
> +################################################################
> #######
> +#######
> +igt@kms_(big_fb|ccs|rotation_crc)@.*(y|yf)-tiled.*
> +igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
> +igt@kms_flip_scaled_crc@.*(yf|y)tile.*
> +igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
> +igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
> +################################################################
> #######
> +####### # Valid skip: Test skip due to hybrid config requirement
> +################################################################
> #######
> +####### igt@kms_addfb_basic@invalid-smem-bo-on-discrete
> +################################################################
> #######
> +####### # Valid skip: 90/270 rotation not supported
> +################################################################
> #######
> +#######
> +igt@kms_big_fb@.*rotate-(90|270)
> +igt@kms_rotation_crc@.*rotation-(90|270).*
> +igt@kms_rotation_crc@bad-(pixel-format|tiling)
> +################################################################
> #######
> +####### # Valid skip: Mutable zpos not supported
> +################################################################
> #######
> +####### igt@kms_atomic@plane-primary-overlay-mutable-zpos
> +################################################################
> #######
> +####### # Valid skip: Cursor size =3D 32 and Cursor size > 256 # are not
> +supported
> +################################################################
> #######
> +#######
> +igt@kms_cursor_crc@.*-max-size
> +igt@kms_cursor_crc@.*-(32x10|32x32|512x).*
> +igt@kms_cursor_crc@cursor.*(21|42|85)
> +################################################################
> #######
> +####### # Valid skip: !cursor_slowpath(&display, i)
> +################################################################
> #######
> +#######
> +igt@kms_cursor_legacy@(short|basic)-busy-flip-before.*
> +################################################################
> #######
> +####### # Valid skip: Use of a single CRTC for two connectors
> +################################################################
> #######
> +####### igt@kms_setmode@basic-clone-single-crtc
> +################################################################
> #######
> +####### # Valid skip: Connector uses CRTC that is incompatible # with
> +the connector
> +################################################################
> #######
> +####### igt@kms_setmode@invalid-clone-exclusive-crtc
> +################################################################
> #######
> +#######
> +# Valid skip: Requires TV connector
> +################################################################
> #######
> +#######
> +igt@kms_tv_load_detect@load-detect
> +################################################################
> #######
> +#######
> +# Valid skip: WB feature not enabled
> +################################################################
> #######
> +#######
> +igt@kms_writeback@.*
> +################################################################
> #######
> +####### # Valid skip: Scaling mode none not supported
> +################################################################
> #######
> +####### igt@kms_scaling_modes@scaling-mode-none
> +################################################################
> #######
> +####### # Valid skip: DG2/MTL/BMG specific CCS tests
> +################################################################
> #######
> +#######
> +igt@kms_ccs@.*-dg2-.*
> +igt@kms_ccs@.*-mtl-.*
> +igt@kms_flip_scaled_crc@.*dg2rcccs.*
> +igt@kms_ccs@.*4-tiled-bmg-ccs
> +################################################################
> #######
> +####### # Valid skip: Valid for display ver < 13
> +################################################################
> #######
> +#######
> +igt@kms_psr2_su@.*
> +################################################################
> #######
> +####### # Valid skip: Downscaling factor not supported
> +################################################################
> #######
> +#######
> +igt@kms_plane_scaling@.*downscale-factor-0-25.*
> +################################################################
> #######
> +####### # Valid skip: Downscaling not supported on second plane MTLP+
> +################################################################
> #######
> +####### igt@kms_plane_scaling@planes-downscale-factor-0-(5|75)$
> +igt@kms_plane_scaling@planes-.*upscale-.*downscale.*
> +################################################################
> #######
> +#######
> +# Valid skip: Simulation specific
> +################################################################
> #######
> +#######
> +igt@kms_pm_dc@dc3co-vpb-simulation
> +igt@kms_simulation_hpd@sim-hpd
> +################################################################
> #######
> +####### # Valid skip: Mei interface not supported MTL+
> +################################################################
> #######
> +####### igt@kms_content_protection@mei-interface
> +################################################################
> #######
> +####### # Valid skip: VGA subtests on chamelium are expected skips for
> +PTL+
> +################################################################
> #######
> +#######
> +igt@kms_chamelium.*@.*(vga).*
> +################################################################
> #######
> +####### # Valid skip: Use either of connected/non-connected kms_bw
> +################################################################
> #######
> +#######
> +igt@kms_bw@linear-tiling-.*-display.*
> +################################################################
> #######
> +####### # Valid skip: Horizontal flip is not supported with tile4
> +surface formats
> +################################################################
> #######
> +#######
> +igt@kms_big_fb@4-tiled.*hflip.*
> +igt@kms_rotation_crc@primary-4-tiled-reflect-x.*
> +################################################################
> #######
> +#######
> +# Valid skip: X tile defeatured
> +################################################################
> #######
> +#######
> +igt@kms_(plane_lowres|plane_multiple|rotation_crc|big_fb|flip_scaled_cr
> +c)@.*(x-tile|xtile|tiling-x).*
> +igt@kms_pipe_stress@stress-xrgb8888-xtiled
> +################################################################
> #######
> +####### # Valid skip: DRRS not supported on LNL+
> +################################################################
> #######
> +#######
> +igt@kms_vrr@seamless-rr-switch-drrs
> +igt@kms_vrr@seamless-rr-switch-vrr
> +igt@kms_dirtyfb@drrs-dirtyfb-ioctl
> +igt@kms_frontbuffer_tracking@.*drrs.*
> +################################################################
> #######
> +####### # Valid skip: PTL+(igfx), UJ not supported # Bspec: 69556
> +################################################################
> #######
> +#######
> +igt@kms_joiner@.*ultra-joiner.*
> +################################################################
> #######
> +####### # Valid skip: Display 12+ is not supporting FBC with PSR2 # in
> +case of selective update.
> +# Recommendation is to keep this combination disabled # Bspec: 50422
> +HSD: 14010260002 # *PR selective update + FBC is not valid.
> +# *PR full frame update/PSR1 + FBC are valid.
> +################################################################
> #######
> +#######
> +igt@kms_psr@fbc-psr2-.*
> +igt@kms_psr2_sf@fbc-(psr2|pr)-.*
> +################################################################
> #######
> +#######
> --
> 2.25.1

