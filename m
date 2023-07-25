Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E94810E3E2
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jul 2023 15:51:46 +0000 (UTC)
Date: Tue, 25 Jul 2023 17:51:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230725155141.723nfuzd22nbr6kp@kamilkon-desk1>
References: <20230721130458.64856-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230721130458.64856-1-aesteve@redhat.com>
Subject: Re: [igt-dev] [PATCH 0/3] Add atomic DRM cursor hotspot test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: belmouss@redhat.com, javierm@redhat.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Albert,

please subscribe to igt-dev mailinglist.

On 2023-07-21 at 15:04:55 +0200, Albert Esteve wrote:
> Add test to verify the kernel patch at [1].
> 
> The test modifies the hotspot x and y properties and
> checks that they get properly updated after every
> display commit.
> 
> The first git commit updating the drm header shall be removed,
> and update the header properly after the kernel patch has
> landed.
> 
> [1] - https://lists.freedesktop.org/archives/dri-devel/2023-July/414509.html

Add this to your 3rd patch with commit message (subject),
as links tends to rot.

Regards,
Kamil

> 
> Albert Esteve (3):
>   drm header update: temp commit
>   igt_kms: add hotspot plane property
>   kms_cursor_legacy: modeset-atomic-cursor-hotspot
> 
>  include/drm-uapi/drm.h    | 54 +++++++++++++++++++++++++++-
>  lib/igt_kms.c             |  9 +++++
>  lib/igt_kms.h             |  4 ++-
>  tests/kms_cursor_legacy.c | 75 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 140 insertions(+), 2 deletions(-)
> 
> -- 
> 2.40.0
> 
