Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8751C00A94
	for <igt-dev@archiver.kernel.org>; Mon, 15 Apr 2024 19:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFCF1127A0;
	Mon, 15 Apr 2024 19:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="1EmLc2M/";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716551127A6
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2024 19:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713209481;
 bh=BqUIf5jewN+46jXWSP5Ihm+MQUrq5DLzybjkeCrj2Ss=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1EmLc2M/ig0Pal3e9VQnkZNNXB60gIpE4zqOqFxovG1pwerFjsXJBOnSF6mAvpxyL
 0WccWqrxVmhRQF/tY2ReUXJW6LRPIm4Kd/saygE248+HQhy7DW/5NOJyJRi5FEJFBA
 I4wLj4PzKpELDEgw/RHVzpcQS5UpfuEtcR97vgYj8kh6nH9Mg9q1tfSQC/9czkEYL/
 dBfORtXixvQidfwtApuXqy1sPYGYbGGZAmY20fe+RitmaU1eiz6j1CEBfF3CdHeHj8
 bZvs61Pv68+GKteTJhjwhwyHR9qvPyJj6wrTYc6rGbSjicGo1isBTDtYroALtJ67Si
 RbUMdLJArrSOg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 31883378000E;
 Mon, 15 Apr 2024 19:31:21 +0000 (UTC)
Date: Mon, 15 Apr 2024 20:31:20 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: tursulin@ursulin.net, daniel@ffwll.ch, boris.brezillon@collabora.com, 
 kamil.konieczny@linux.intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org, healych@amazon.com, kernel@collabora.com
Subject: Re: [PATCH v2 2/2] tools/gputop: toggle sysfs profiling knob if
 available for device
Message-ID: <42eaigc7oogdzi4km5ytjph5ejzej65pgzygck24apdt2io4wr@v72l4hu47vic>
References: <20240402222813.277470-1-adrian.larumbe@collabora.com>
 <20240402222813.277470-3-adrian.larumbe@collabora.com>
 <xc4vz6uq4llsexgwurudl3jtv6bke3b4vsqnqgvvhs3gtkd6ay@5glimn77s3dq>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xc4vz6uq4llsexgwurudl3jtv6bke3b4vsqnqgvvhs3gtkd6ay@5glimn77s3dq>
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

On 03.04.2024 15:46, Lucas De Marchi wrote:
> On Tue, Apr 02, 2024 at 11:27:45PM +0100, Adrián Larumbe wrote:
> > For every DRM device that enables its job accounting HW from user space,
> > toggle it right before obtaining per-client fdinfo numbers.
> > 
> > Make sure profiling status is returned to its original state before
> > exiting, by handling the SIGINT signal just like in intel_gpu_top.
> 
> isn't this something that should be rather tracked on the kernel side
> rather than relying on the userspace to behave?

This would simplify handling of the sysfs knob state from user space, but I'm
not sure normal sysfs device attributes are allowed to keep an internal state
between _show() calls.

> 1) call gputop
> 2) call gputop, because you forgot you had it open in another ssh
>    session
> 3) stop (1), because ssh session dies

I feel tempted to brush this off as legitimate behaviour, albeit 'undefined'.
If we cannot handle the scenario in which multiple profilers tweak the profiling
state at the same time from kernel space, then I would prefer to expect users to
readjust the sysfs attribute value manually.

> From the kernel side, I think it could be done by enabling it on fd
> open, disabling it on last close.

Adrian Larumbe
