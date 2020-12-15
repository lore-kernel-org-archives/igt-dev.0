Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA40C89700
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Dec 2020 09:00:24 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201215084825.101358-2-maarten.lankhorst@linux.intel.com>
References: <20201215084825.101358-1-maarten.lankhorst@linux.intel.com>
 <20201215084825.101358-2-maarten.lankhorst@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 15 Dec 2020 09:00:21 +0000
Message-ID: <160802282111.8745.912787390753427568@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests: Do not use pread on userptr
 in gem_exec_parallel.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Maarten Lankhorst (2020-12-15 08:48:25)
> It's even silly to use pread, directly read from the pointer instead by
> executing gem_wait first.

Major GEM violation.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
