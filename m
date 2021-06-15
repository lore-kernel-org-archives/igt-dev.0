Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D39589A91
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jun 2021 08:08:44 +0000 (UTC)
Date: Tue, 15 Jun 2021 11:10:37 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YMhgfbVhm7iLVTuj@platvala-desk.ger.corp.intel.com>
References: <20210614153557.19934-1-Anson.Jacob@amd.com>
 <20210614153557.19934-2-Anson.Jacob@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210614153557.19934-2-Anson.Jacob@amd.com>
Subject: Re: [igt-dev] [i-g-t, 2/2] tests/amdgpu: Fix typo in amd_module_load
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
To: Anson Jacob <Anson.Jacob@amd.com>
Cc: igt-dev@lists.freedesktop.org, Victor Lu <victorchengchi.lu@amd.com>, markyacoub@google.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jun 14, 2021 at 11:35:57AM -0400, Anson Jacob wrote:
> From: Victor Lu <victorchengchi.lu@amd.com>
> 
> A typo in amd_module_load was causing the test to fail.
> igt_assert_f(err, 0) should have been igt_assert_eq(err, 0),
> to check err == 0. Also added drm_fd >= 0 check and made
> ioctl query more explicit.
> 
> Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
> Acked-by: Anson Jacob <Anson.Jacob@amd.com>


Squash these two patches together.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
