Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E5510E763
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 14:00:27 +0000 (UTC)
Date: Wed, 8 Nov 2023 15:00:04 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Message-ID: <20231108140004.y6zekzwoyxz3po4k@kamilkon-desk.igk.intel.com>
References: <20231107174349.60255-1-kamil.konieczny@linux.intel.com>
 <20231107174349.60255-2-kamil.konieczny@linux.intel.com>
 <gqlvXYvm6ozZvtj7lHmPRHff48EsWp1x8-5M_xRT4pWjPIGy7TOkkl2pjF8o6douyekRxZUy5R31dql7aYsabwYfT3gYxL0HN31_5hkIqKs=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <gqlvXYvm6ozZvtj7lHmPRHff48EsWp1x8-5M_xRT4pWjPIGy7TOkkl2pjF8o6douyekRxZUy5R31dql7aYsabwYfT3gYxL0HN31_5hkIqKs=@emersion.fr>
Subject: Re: [igt-dev] [PATCH i-g-t v1 1/5] include/drm-uapi: sync core
 headers with drm-next
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Simon,
On 2023-11-07 at 17:54:22 +0000, Simon Ser wrote:
> Reviewed-by: Simon Ser <contact@emersion.fr>
> 
> Note, I will need to sync once again the core DRM headers soon for
> CLOSEFB (it's sitting in drm-misc-next at the moment). If you don't have
> a real use for this update, maybe better wait for a bit.

I will wait then for core headers, I do not know if there are any
new tests for these fourcc formats. Meanwhile I plan to merge others
with big diff.

Regards,
Kamil
