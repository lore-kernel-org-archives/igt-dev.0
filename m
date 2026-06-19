Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001CDCD4F26
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 13:30:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A732410E0B5;
	Fri, 19 Jun 2026 13:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="hQ/K8XO8";
	dkim-atps=neutral
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com
 [136.143.188.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EEF10E088
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 13:30:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1781875794; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=W9Wjb7OpTrNy4c57ocJt6xI6LhEZ3X44RVFK96kGRV8bqnxQb6UGUm/JxIjcaDvDM6L1raUfu4Se+yI9k3Y298GDlSJhyr+dwe6YJwhT0xIzoL3XARcXDktGOSRusYnBlLfdexUw2KgSNM8gr/sTuVhwIP3kmVEISCXl94nrAsM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1781875794;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Y+0WvewkaKK5HHNDoaEApRh45Gmgf9kjuHcjTRmOAmE=; 
 b=brOnYWH6dM7gqhIjLJL1jFx1EhwJqwR0ZbN8W74FXdH1u6luHmNtjYtlQCeMz853X4bM/xFC5zTyybljwXKLnxBUARmqibqw6c4CLFHLIOj6LJ1gKYQVOO0Ek7Ll9JvNo98QxxLmVpD8mX6MmPz+H28uwWOtG/ao10y2BWJTRj0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781875794; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Date:Date:Message-Id:Message-Id:Reply-To;
 bh=Y+0WvewkaKK5HHNDoaEApRh45Gmgf9kjuHcjTRmOAmE=;
 b=hQ/K8XO85lr4WGlPpv9uZvLgud2C/Rl34pWKvoot3LFZpCKuirJEFyfBgR05lxIM
 C6RW+wdbTNo5PCSyHUcQoXe7xrV0UxcgkkA2Ayo5V+V7fJG5fzrqg5cgLw4s2rHTGa2
 broLNjEAnQE6w3lDKp9n+OVsl0tIt5Zd5ibhar6Y=
Received: by mx.zohomail.com with SMTPS id 1781875791446218.120230617679;
 Fri, 19 Jun 2026 06:29:51 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 2/2] tests/panthor/panthor_vm: Add vm_bind
 intersect-with-kbo-range test
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 igt-dev@lists.freedesktop.org, kernel@collabora.com
In-Reply-To: <20260617124948.buvoihk3cnxltx5e@kamilkon-DESK.igk.intel.com>
References: <20260616-panthor-vmbind-checkaddr-v1-0-f35b1b067f7c@collabora.com>
 <20260616-panthor-vmbind-checkaddr-v1-2-f35b1b067f7c@collabora.com>
 <20260617124948.buvoihk3cnxltx5e@kamilkon-DESK.igk.intel.com>
Date: Fri, 19 Jun 2026 14:28:54 +0100
Message-Id: <178187573439.1919959.16101885483682467264.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=MIbn7nW9NAzgckjJfQATBhWHrA4aWsgBjSuWQGjbupo=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqNURNZuMYzGbV3S37zl+DDAQTy3y/80BSuff99
 9p34hHIdN2JAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCajVETQAKCRAOJn5M7lND
 PXbUC/9p8TeTYNaUFPnkg5u2lEz5y6CQCU8wSk9gbiZdsSb8bvNAxkhs92/6scW08BE+PJgImVr
 bb26QY6FEEcJwmm3CWDDCPLZhij+edXltuvQEoUcVm0nVKUEU6JrJ8CqBcbtco3TaIB5KyJSG9Q
 6CdvVmpIQy8x6WPBxbO/662wzqrod5RmBQP+tWZarboV+KejWhOgcSLkuWVX+aqozyTKOLnVeP9
 caesHwp+D7yxDLp1DARfttL/XhlzSL/gpbkLtbz0SI3DwoRWCjRa9ScBmi5QRGHz8wSlnZco3z0
 vmXXEYgVy4HV7cc3DQLtv0YuuptVHlvp6xpRpnZflBScJIJVOt6feikp8HKWkFx4ajPeOGXcaHi
 KeBvt7Zu+tSROX+eFOnlu+hZYKW85Dons7bfBdCQ67ySDVxU3yQ/meZ54MpqKZ5OyyNZtGwpTWR
 gdiczKCyawjcdtJL2s2P9lDbkX6d3qi5Y6FYAGhU3A78+0exxBvfYDGnkkfTd/hAMJkHI=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D
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

On 2026-06-17 14:49:48+02:00, Kamil Konieczny wrote:
> Hi Adrián,
> On 2026-06-16 at 16:43:23 +0100, Adrián Larumbe wrote:
> 
> > Users of vm_bind ioctl() should never specify a VA region that intersects
> > with that reserved for internal kernel BOs.
> > 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  tests/panthor/panthor_vm.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
> > index 92b105b9e83a..9548dbcbaa45 100644
> > --- a/tests/panthor/panthor_vm.c
> > +++ b/tests/panthor/panthor_vm.c
> > @@ -270,6 +270,23 @@ int igt_main() {
> >  		igt_panthor_vm_destroy(fd, vm_id, 0);
> >  	}
> >  
> > +	igt_describe("Perform a vm_bind in the VM's kernel BOs reserved range");
> > +	igt_subtest("vm_bind_intersect_kbo_range") {
> 
> In our Intel tests we use '-' as word separator, so there is
> igt@this_is_test_name@and-this-is-subtest-name
> 
> But it is only out naming convention, yours can differ.

It seems all existing Panthor tests follow the 'all underscores' naming model.
If you want I could change them all to fit the Intel pattern, but I guess that's
best done in a separate patch series.

> LGTM
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Regards,
> Kamil
> 
> PS. I could merge it now or should I wait for others to review?


