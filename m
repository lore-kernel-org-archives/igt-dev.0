Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844476EB0A
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jul 2021 13:47:54 +0000 (UTC)
Date: Fri, 23 Jul 2021 09:47:49 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210723134749.t4t4jtw27uuzzmqs@outlook.office365.com>
References: <20210624172436.1467489-1-markyacoub@chromium.org>
Content-Disposition: inline
In-Reply-To: <20210624172436.1467489-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] Add .vscode to gitignore
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
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 06/24, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> Given the popularity of vscode, .vscode is a directory that holds
> the personal vscode preferences.
> 
> ---
>  .gitignore | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/.gitignore b/.gitignore
> index 88dd0338..119c80ba 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -50,3 +50,5 @@ results
>  build
>  patches
>  Makefile
> +
> +.vscode
> \ No newline at end of file

lgtm,

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

> -- 
> 2.32.0.93.g670b81a890-goog
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Figt-dev&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7C1f883944678440bcd68808d93734fd8a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637601523013147260%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=yEfFsitJBtVLxuk%2BA%2FM4nqYrkrYrOrBN9jxfeXDnwnc%3D&amp;reserved=0

-- 
Rodrigo Siqueira
https://siqueira.tech
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
