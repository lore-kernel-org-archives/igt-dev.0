Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E3BD43341
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 11:14:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE19110E307;
	Thu,  7 Nov 2024 11:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=atlas.cz header.i=@atlas.cz header.b="fLI6BWHU";
	dkim=pass (1024-bit key) header.d=atlas.cz header.i=@atlas.cz header.b="fLI6BWHU";
	dkim-atps=neutral
Received: from gmmr-2.centrum.cz (gmmr-2.centrum.cz [46.255.227.203])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E7E10E2DE
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 13:53:03 +0000 (UTC)
Received: from gmmr-1.centrum.cz (envoy-stl.cent [10.32.56.18])
 by gmmr-2.centrum.cz (Postfix) with ESMTP id 56819200F42B
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 14:53:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atlas.cz; s=mail;
 t=1730901181; bh=FdB5nV6Ql49XBPvdoNqGLCe7cXtNk3daBuHueK3v8uE=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=fLI6BWHU+UDL6Fe9wES2TEh65+pYx00uHxfrgPzmtNSjc81WEgN9EEMEaN2tblDwV
 thhZJG3tLoIow5sMbtt3K4sy0kLSuH7XbVNocOG/5HY90JQjOXcnUYC1oeN+6PwIFI
 m0SAluQIQTMfv8IzT6nPVds7FhFieSIQrFx3Q7Xk=
Received: from gmmr-1.centrum.cz (localhost [127.0.0.1])
 by gmmr-1.centrum.cz (Postfix) with ESMTP id 52DB21AE
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 14:53:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atlas.cz; s=mail;
 t=1730901181; bh=FdB5nV6Ql49XBPvdoNqGLCe7cXtNk3daBuHueK3v8uE=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=fLI6BWHU+UDL6Fe9wES2TEh65+pYx00uHxfrgPzmtNSjc81WEgN9EEMEaN2tblDwV
 thhZJG3tLoIow5sMbtt3K4sy0kLSuH7XbVNocOG/5HY90JQjOXcnUYC1oeN+6PwIFI
 m0SAluQIQTMfv8IzT6nPVds7FhFieSIQrFx3Q7Xk=
Received: from antispam62.centrum.cz (antispam62.cent [10.30.208.62])
 by gmmr-1.centrum.cz (Postfix) with ESMTP id 51B641AD
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 14:53:01 +0100 (CET)
X-CSE-ConnectionGUID: LKx1YKIfTROwi71biD2iQg==
X-CSE-MsgGUID: RMqss0wrQP+SPyBem9Jsew==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2HHAwAGdCtn/03h/y5agQkJgUqJe5Fxi3WGNYEghACIS?=
 =?us-ascii?q?Q8BAQEBAQEBAQEJRAQBAT+ESAKKNic3Bg4BAgQBAQEBAwIDAQEBAQEBAQEBD?=
 =?us-ascii?q?QEBBgEBAQEBAQYGAQKBHYU1U4JiAYN/AQEBAQIBIw8BOxALCw0LAgImAgJWB?=
 =?us-ascii?q?gGDE4IwAREjrn16gTIaAmXcbwKBI2KBKoEaLohMAYpgQoINhD8+iB6CaQSCS?=
 =?us-ascii?q?IUiJYEmhwdol3lSexwDWSABEQFVExcLBwWBKiQsA4F7WH+BOYFRAUKCXUohg?=
 =?us-ascii?q?xyBXgU3SYJKaUs6Ag0CNoIkJFmCToUdgQsDg2KEaYEjHUADC209NRQbBqZqH?=
 =?us-ascii?q?bEvlQ+DHIEIhE2dDDODcZN4A5JhLphJIqkAgX2CADMiMDuCaFEZjjwWxVKBM?=
 =?us-ascii?q?gIHAQoBAQMJgjuPN4FLAQE?=
IronPort-PHdr: A9a23:1lLB0BPzuQOvem5wYmIl6nZVCxdPi9zP1u491JMrhvp0f7i5+Ny6Z
 QqDvqwr1AWCANmTq6odzbaN6+a4AS1IyK3CmU5BWaQEbwUCh8QSkl5oK+++Imq/AdjUKgcXJ
 4B8bmJj5GyxKkNPGczzNBX4q3y26iMOSF2kbVImbuv6FZTPgMupyuu854PcYxlShDq6fLh+M
 Ai6oR/eu8QYnIduMLo9xgXGrnZIdOld2GdkKU6Okxrm6cq98oJv/z5Mt/498sJLTLn3cbk/Q
 bFEAzsqNHw46tf2vhfZVwuP4XUcUmQSkhVWBgXO8Q/3UJTsvCbkr+RxwCaUM9X5QrwtRzms4
 LplRAfnhykbOTE59nrXitFrg6JAvB2hvR1/zJXKb4yTKfFzY7nSfdIeRWpGQ8ZRSylMCZ6yY
 ocTE+YMO/tTopLjrFUSsxSxGQisBPvuyjBWgH/2wbY62PklHQ3fwQAsA84CvHHSod7oNqkdT
 Pq1wbHGwzvDcf1YxDTz6IbHfR89vP6CUrB/fNHNyUQsDQ7JkkmcpZDnMj6Ty+8Ds3Kb7+1lV
 e+3kWAotR1xoiKyzcgjkIbJgJwQylPZ/ih+2ok1P964R1R+YdG+CptdrDuVN5dyQsw4WGFko
 jo1y7wftJO9YSMFx4gpyQTFZPybb4iH/AjjVOCJLDp2hHxoZLyyigi8/EWuyeDwStS53VdXo
 iZZjtTBuG4B2gHO5sWGSfZw8Fms1DeL2g3R6OxJIl04mKnGJpMvxrM9kIcYv0fbHiLul0j7j
 bWaelsk9+Wo8ejrfKvqq5+GO4J2iAzyKroiltGxDOgiLAQCQXSX9f6i2LDs4UH1WrFHg/wwn
 6LEqp7VP94bqbS8AwJN14Yj7AuwACm+3dQDmHkHMEpFeBWaj4j1I13OIO73DfO4g1m0nzdrw
 unKPqbkApXRNnjPjavtcaxh5EFCzgoz0cpf549RCr0bPP3yW1f9tN3eDhAnLwy52+nqBdRn2
 o8AWW+CArWVPL3MvVKI/O4iIeuBaJcQuDnnKvgl4/DujWU+mV8YZaSmx4EXaHOiEfRjOUqZe
 2Hhjc0dEWcOpAU+V/bmh0GDUDJLfXa9Q7o85i0nCIKhFYrMXJ2igKaA3CihGJ1afGRGBUqWE
 Xf1coWLQOkDZTmOLc9mljwEUaKuRJQm1RG0rgD20aZoLu3R+iEAr5LsyMB15/HPlRE17TF0D
 N6S02SMT2FwhG8IRDg23KZ+oUNj1liC0K54gvxDGNxX5vNJVBo6NJHGw+x7DdDyRhzOftOTR
 Fm6RdWmBCk9TsgtzN8Wf0Z9B9KigwjC3yqlH78ZjqGEC4Iq8q/H23jxJt19y2rd1KU7gVkmW
 NVAOnO7iaFh7AjTBJLJk0KBl6qwcqQcxiHN+H+FzWWVpE5YShJ/Ub3ZXXADYUvbtdr06lvfQ
 L+tCLQnNxNMx9aNJKREdNPnkUlLSvH7NNvDZmK+gX2wCgqQy72UdYTkY2oT0D3GCEgcnQAe5
 W6IOxEmCCmuu27eFyRuFVz3bEPs7+Z+rHS7Q1cswQ+Td0Nv2On9xhlApvWZSvdb/bUCuSoqu
 TNlVAK+1tfXD5yDoAxgca5OZ8IV5FZByHKftgphM5jmJKdn0BpWcgtr+k/jyT1zC55cio4kt
 n4nwAdpKr6fyBVGbTzclbn8ILxeLCHW9QqybqTbkgXX3MyX86FJ7P0itlDpsSmiEU4m+n9gy
 dAT2HyZsMbkFg0XBKr8Tlx/yRF8BLKSNiAn5IrR3GdEOLWwuySE0MB/V7ht8QqpY9oKaPDML
 wT1CcBPQpH2cIQX
IronPort-Data: A9a23:roQMgKrVjEn7Ox6ckqd1/4lLERheBmISZBIvgKrLsJaIsI4StFCzt
 garIBnSa62CNDSgftp2aYnj8UtT65GEzIMyHVBpqC9nQX5A9ePIVI+TRqvSF3jLcpCcFhIPA
 +Y2N4OcdpBkFhcwgj/3b9ANeFEljfngqoLUUbOCZ2YoA1c5FU/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSss9JOGjt8B5mr9lU25ZwehBtC5gZiPKkT4geH/5UoJMt3yZ+ZfiaQrrZ8QbbSq
 9brlNmR4m7f9hExPdKp+p6TWlEKWLPbIT+VgXNQXaW46jAazsDl+vtT2FI0MC+7uh3R9zxD4
 IwlWa+YFW/FCpbxdNE1CHG0JQklZPEbp+WXSZSImZf7I0XuKxMAyhj1Za08FdVwFu1fWQmi+
 RGEQdykg9/qa++emdqGpudQassLCOr7ZbI8m39c9xbGDKl/S5HvGaTz6ooNtNswrpgm8ff2a
 M9ccj9zdE2YJRZCPEsNFZd4l/XAanvXL2Me8g/I4/Btvi6Mk2Sd05C0WDbRUtWQRsxQl1ywr
 37C9n+/CQNy2Nm3lmTUriL11rSncSXTYqcLD6bg6eRTuB6o/n05BRhHd0C2vqzs4qK5c5cFQ
 6AOwQInobIz/UrtStDnQhiyrVaPuRoYUtBXCeR84waIooLX6gOYAi4HSThAZdc0st4eQT0sy
 0/PntX1CDgpu7qQIVqc+avRoT6sESwUNnMZIyEeQAYJ7sLgvIYryBXVQb5e/LWd0oOzQ2yth
 WrQ8W5h2N3/kPI26klyxnif6xrEm3QDZlddCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:/mHaS6PmmEmMksBcTtajsMiBIKoaSvp037AO7TESdfUzSL38qy
 nOpoV56faaslwssR0b9OxofZPwJU80lqQU3WByB9mftWDd0QPCEGgh1+rfKlbbdBEWmNQw6Z
 td
X-Talos-CUID: =?us-ascii?q?9a23=3A6Cn5UWkBaEjK6tmAMd5xXPxzbPHXOVn+3C7hAG6?=
 =?us-ascii?q?2NVxOV7zKEFWR1PllqsU7zg=3D=3D?=
X-Talos-MUID: 9a23:bXfBAgrJTs/ybn+9IxUezwtHLdxzu7u0MXhOqq0XkcSBZA5rNijI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.11,262,1725314400"; d="scan'208";a="76948183"
Received: from unknown (HELO gm-smtp10.centrum.cz) ([46.255.225.77])
 by antispam62.centrum.cz with ESMTP; 06 Nov 2024 14:53:00 +0100
Received: from arkam (ip-213-220-240-96.bb.vodafone.cz [213.220.240.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by gm-smtp10.centrum.cz (Postfix) with ESMTPSA id BC6DF808F87D;
 Wed,  6 Nov 2024 14:53:00 +0100 (CET)
Date: Wed, 6 Nov 2024 14:52:59 +0100
From: Petr =?utf-8?B?VmFuxJtr?= <arkamar@atlas.cz>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH i-g-t] lib/igt_profiling: add include for PATH_MAX constant
Message-ID: <2024116135259-Zyt0u-XsFfIgGtO8-arkamar@atlas.cz>
References: <20241103171806.10248-1-arkamar@atlas.cz>
 <202411583120-ZynX2Bpb672E8EEZ-arkamar@atlas.cz>
 <20241106130143.z7di4t2er6oo56ac@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241106130143.z7di4t2er6oo56ac@kamilkon-desk.igk.intel.com>
X-Mailman-Approved-At: Thu, 07 Nov 2024 11:14:56 +0000
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

Hi Kamil,

On Wed, Nov 06, 2024 at 02:01:43PM +0100, Kamil Konieczny wrote:
> Hi Petr,
> On 2024-11-05 at 09:31:20 +0100, Petr Vaněk wrote:
> > ...
> > Resending the patch as it seems it did not make it to the list last
> > time.
> 
> This could happen if you are not subscribed to igt-dev mailing list,
> your patch was deliverd to ML with a few days delay.

I thought so, but I wasn't sure about it, therefore I decided to send it
again after few days.

Thank you for reviews.

Cheers,
Petr

> Regards,
> Kamil
