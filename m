Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 29 May 2020 14:21:41 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200529112141.GD9497@platvala-desk.ger.corp.intel.com>
References: <20200528133835.5087-1-rohan.garg@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528133835.5087-1-rohan.garg@collabora.com>
Subject: Re: [igt-dev] [PATCH i-g-t] panfrost: Test labeling functionality
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
To: Rohan Garg <rohan.garg@collabora.com>
Cc: igt-dev@lists.freedesktop.org, alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, May 28, 2020 at 03:38:35PM +0200, Rohan Garg wrote:
> Introduce tests to cover the new generic labeling ioctl's
> being reviewed here [1].
> 
> Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
> 
> [1] https://patchwork.freedesktop.org/series/77267/
> 
> Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
> ---
>  include/drm-uapi/drm.h    |  23 ++++++-

Please update drm.h in a separate commit, and state which kernel
commit (and from which repo) it's copied from. Examples can be seen in
the git log for the file.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
